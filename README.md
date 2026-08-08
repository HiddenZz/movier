# film-downloader

Background service for a self-hosted movie platform. Consumes download tasks from [film-stream](link-to-repo) via Redis Streams, downloads torrents, converts video to multi-bitrate HLS, and uploads to MinIO.

## How it works

1. film-stream publishes a download task to Redis Streams (`download:stream`)
2. film-downloader picks up the task and downloads the torrent (Bt library, DHT, encrypted connections)
3. FFmpeg converts the downloaded video to HLS with multiple quality levels (1080p, 720p, 480p, 360p)
4. HLS playlists and segments are uploaded to MinIO
5. film-stream serves the HLS content to the client

**Future goal:** real-time streaming from torrent without waiting for full download and HLS conversion.

## Architecture

Two services communicating via Redis Streams:

- **film-stream** — API gateway, TMDB proxy, torrent search, HLS streaming
- **film-downloader** (this repo) — torrent download, HLS conversion, MinIO upload

Both services are Spring Boot / Java applications.

## Infrastructure

- **PostgreSQL** — state persistence (content processing state)
- **Redis** — message broker (Redis Streams) + progress tracking
- **MinIO** — object storage for HLS media files
- **Jackett** — torrent indexer (config stored in `docker/jackett/`)

## Build & Run

```bash
./gradlew build      # build
./gradlew bootRun    # run
./gradlew test       # tests
```
