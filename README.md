# movier

Самохостируемая платформа для поиска, скачивания и просмотра фильмов
и сериалов. Монорепозиторий: мобильный клиент и два бэкенд-сервиса.

Полное описание возможностей — [`docs/project.md`](docs/project.md).

## Состав

| Путь | Что это | Порт |
| ---- | ------- | ---- |
| [`apps/mobile`](apps/mobile) | Flutter-клиент (iOS + Android) | — |
| [`apps/stream`](apps/stream) | Spring Boot: TMDB, Jackett, отдача HLS — API клиента | 8084 |
| [`apps/downloader`](apps/downloader) | Spring Boot: торрент → FFmpeg/HLS → MinIO | 8085 |
| [`deploy`](deploy) | docker-compose с инфраструктурой | — |

Клиент ходит только в `stream`. `stream` ставит задачу в Redis-стрим
`download:stream`, `downloader` её выполняет и отвечает в `result:stream`;
готовый HLS лежит в бакете `content` MinIO.

## Быстрый старт

```bash
# 1. инфраструктура: postgres, redis, minio, jackett
cd deploy && docker compose up -d && cd ..

# 2. секреты для stream
cp apps/stream/.env.example apps/stream/.env   # вписать TMDB_API_TOKEN и JACKETT_API_KEY

# 3. бэкенд (в отдельных терминалах)
./gradlew :stream:bootRun
./gradlew :downloader:bootRun

# 4. клиент
cd apps/mobile && flutter pub get && flutter run
```

Требуется JDK 24, Flutter SDK, Docker и `ffmpeg` в `PATH` (downloader
берёт его оттуда).

### Сервисы инфраструктуры

| Сервис | Адрес | Доступ |
| ------ | ----- | ------ |
| PostgreSQL | `localhost:5432`, БД `movie` | `movie_user` / `movie` |
| Redis | `localhost:6379` | — |
| MinIO S3 | `localhost:9000`, консоль `:9001` | `minioadmin` / `minioadmin123` |
| Jackett | `localhost:9117` | — |

Схемы БД разведены: `film_stream` — stream, `film_download` — downloader,
миграции Flyway накатываются при старте приложения.

## Разработка

Правила работы с репозиторием — [`CLAUDE.md`](CLAUDE.md).
Документация модулей — рядом с модулем (`apps/*/docs/`).
