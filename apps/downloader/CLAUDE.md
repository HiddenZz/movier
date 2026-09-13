# CLAUDE.md

## Structure

Spring Boot 3.5 application. Java, Gradle.

```
feature/downloader/    — torrent download (Bt library, DHT, sequential piece selection)
feature/formatting/    — HLS conversion (FFmpeg, multi-bitrate parallel encoding)
feature/saver/         — MinIO/S3 upload (master playlist, variant playlists, segments)
feature/progress/      — state machine + progress reporting (PostgreSQL + Redis)
feature/infrastructure/redis/ — Redis Streams setup, listener container
common/                — configuration, properties, utilities
```

Key stack: PostgreSQL + MyBatis, Redis (Jedis), MinIO, Flyway, MapStruct, Lombok, Bt (torrent), FFmpeg, m3u8-parser.

## Documentation

Detailed docs live in `docs/`. Read relevant files before working on a feature.

- `docs/architecture.md` — processing pipeline, Redis Streams, state machine
- `docs/configuration.md` — properties, beans, external connections
- `docs/backlog.md` — tasks: must-do, nice-to-have, ideas to explore

## Conventions

**Communication:** Russian with the user. English for all code, comments, docs, and commits.

**Commits:** Conventional commits (`feat`, `fix`, `refactor`, `docs`, `chore`).

**Backlog:** When the user shares an idea or task, add it to `docs/backlog.md` in a structured form with a brief note on possible implementation approach.

## Critical Rules

**Before starting non-trivial work**, read CLAUDE.md and relevant docs.

**After changing API or database schema**, update corresponding files in `docs/`.

### Before Writing Code

For trivial fixes (typos, one-line changes, simple renames) — skip discussion and just do it.

For anything non-trivial, do NOT start implementation until all open questions are resolved:

1. Challenge the approach — point out flaws, missed edge cases, and security risks. Be direct, not polite.
2. Ask about unknowns — if anything is ambiguous, ask. Do not guess or assume.
3. Propose alternatives — if there is a simpler or more robust way, say so and explain why.
4. List edge cases — enumerate what can break: concurrent access, empty inputs, large payloads, permission gaps, migration rollbacks.
5. Wait for confirmation — do not write code until the user explicitly approves the plan.

### General

- Do only what was asked. Do not refactor surrounding code, add comments to code you did not change, or introduce abstractions for hypothetical future needs.
- Be blunt. Point out bad ideas. Disagree when you have a reason. The goal is a correct implementation, not a fast one.
