# Architecture

## Services

Two Spring Boot services:

- **film-stream** — API for clients. Proxies TMDB, searches torrents via Jackett, streams HLS content from MinIO.
- **film-downloader** — Downloads torrents, converts to HLS, uploads to MinIO.

## Communication

Services communicate via **Redis Streams**:

- `download:stream` — film-stream publishes download tasks, film-downloader consumes them
- Payload field: `download-payload` (JSON-serialized torrent info)

Internal streams within film-downloader (pipeline progression):

- `formatting:stream` — published after download completes, consumed by formatter
- `save:s3:stream` — published after formatting completes, consumed by S3 uploader

## Processing Pipeline

```
Redis (download:stream)
    ↓
TorrentDownloaderService — downloads torrent via Bt library
    ↓  reports ContentState.Downloaded → publishes to formatting:stream
Redis (formatting:stream)
    ↓
FfmpegFormatterService — converts to multi-bitrate HLS (parallel per quality)
    ↓  reports ContentState.Formatted → publishes to save:s3:stream
Redis (save:s3:stream)
    ↓
SaveS3ServiceImpl — uploads playlists + segments to MinIO
    ↓  reports ContentState.Completed
PostgreSQL (final state persisted)
```

## State Machine

States tracked in PostgreSQL (`film_download.content_state`):

| State | Meaning | Next |
|-------|---------|------|
| `DOWNLOADING` | Torrent download in progress | `DOWNLOADED` |
| `DOWNLOADED` | Download complete, file on disk | `FORMATTING` |
| `FORMATTING` | FFmpeg HLS conversion in progress | `FORMATTED` |
| `FORMATTED` | HLS files ready on disk | `COMPLETED` |
| `COMPLETED` | Uploaded to MinIO | — |
| `FAILED` | Error at any stage (cause stored) | — |

State transitions handled by `ContentStateReporterImpl` → updates DB + publishes next stream message via `ContentEventPublisher`.

## Torrent Download

- Library: Bt (bt-core, bt-dht, bt-http-tracker-client)
- DHT enabled, encrypted connections, sequential piece selection
- Downloads torrent file from tracker link, then starts async BT client
- Progress reported to Redis: `progress:DOWNLOAD:{tmdbId}`

## HLS Formatting

- FFmpeg via `ffmpeg-cli-wrapper`
- Qualities: 1080p (5Mbps), 720p (2.5Mbps), 480p (1Mbps), 360p (1Mbps)
- Only encodes qualities that fit within source resolution
- All qualities encoded in parallel via `CompletableFuture`
- Generates master playlist referencing variant playlists
- Segment duration: 10 seconds
- Progress reported to Redis: `progress:FORMATTING:{tmdbId}`
- Presets defined in `resources/config/video-presets.yaml`

## S3 Upload

- MinIO client uploads to path: `content/{tmdbId}/{contentUuid}/`
- Master playlist → `master.m3u8`
- Variant playlists → `{quality}/playlist.m3u8`
- Segments → `{quality}/segment_N.ts`
- HLS playlists get content-type `application/vnd.apple.mpegurl`
- Segment uploads parallelized with virtual threads
- Retry with exponential backoff (200ms base, random jitter)

## Redis Stream Listeners

All listeners use `StreamMessageListenerContainer`:

- 4 concurrent threads
- Poll timeout: 1 second
- Batch size: 10
- Consumer group acknowledgment after processing

Task execution delegated to `TaskAllocatorService` → submits to thread pool executor (5 core/max, 10 queue, caller-runs rejection).

## Storage

- **PostgreSQL** — schema `film_download`, table `content_state`, managed by Flyway
- **Redis** — message broker (Streams) + progress hashes (TTL 1 hour)
- **MinIO** — HLS files, bucket prefix `content`
