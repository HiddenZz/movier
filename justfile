# Port of the stream service the mobile client talks to
stream_port := "8084"

# Compose resolves relative volume paths against the file's directory, so -f is enough
compose := "docker compose -f deploy/docker-compose.yml"

_default:
    @just --list

# Start the infrastructure the backend depends on: postgres, redis, minio, jackett
infra-up:
    {{ compose }} up -d

# Stop the infrastructure, keeping volumes
infra-down:
    {{ compose }} down

# State of the infrastructure containers
infra-ps:
    {{ compose }} ps

# Follow the infrastructure logs; pass a service name to narrow it down
infra-logs service="":
    {{ compose }} logs -f {{ service }}

# Forward device localhost:8084 to the host, so the client reaches local stream
reverse:
    adb reverse tcp:{{ stream_port }} tcp:{{ stream_port }}

# Drop the reverse forwarding for the stream port
unreverse:
    adb reverse --remove tcp:{{ stream_port }}

# Show active reverse forwardings
reverse-list:
    adb reverse --list

# Flutter deps update
[working-directory('apps/mobile')]
fl-get:
    fvm flutter clean
    fvm flutter pub get

# Flutter generate code
[working-directory('apps/mobile')]
fl-gen:
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm dart format lib

# Flutter gen l10n
[working-directory('apps/mobile')]
fl-lgen:
    fvm flutter gen-l10n
    fvm dart format lib

# Dart format
[working-directory('apps/mobile')]
fl-format:
    fvm dart format lib
