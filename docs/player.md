# ТЗ: интеграция `video_player` и тестового HLS-плеера во Flutter-приложение

## 1. Цель
Добавить в существующее Flutter-приложение возможность воспроизведения HLS-потока (`master.m3u8`) с локального сервиса и собрать минимальный экран-плеер для ручного тестирования на Android-эмуляторе.

## 2. Контекст и окружение
- Источник видео — собственный HLS-прокси. Поток: **обычный HLS VOD**, MPEG-TS сегменты (`.ts`), **без шифрования и без DRM**, одно качество (360p). Адаптивный битрейт не требуется, но плеер не должен ломаться, если в master появятся доп. качества.
- Эндпоинты прокси:
  - `GET /stream/{contentUuid}/master.m3u8` — мастер-плейлист (точка входа для плеера).
  - `GET /stream/{contentUuid}/{quality}/playlist.m3u8` — плейлист качества.
  - `GET /stream/{contentUuid}/{quality}/{segment}` — TS-сегмент.
- Тестирование: **Android-эмулятор**. Сервис развёрнут на хосте на `localhost:8080`. Из эмулятора хост доступен по адресу **`http://10.0.2.2:8080`**.
- Протокол **HTTP (не HTTPS)** — это требует явного разрешения cleartext-трафика на Android (см. п. 5).

## 3. Объём работ (scope)
1. Подключить пакет `video_player` (последняя стабильная версия с pub.dev).
2. Настроить Android на разрешение cleartext-HTTP к `10.0.2.2`.
3. Реализовать экран `TestPlayerScreen` с минимальным управлением и состояниями загрузки/ошибки.
4. Сделать base URL и `contentUuid` легко настраиваемыми (без правки логики плеера).
5. Добавить точку входа на экран (кнопка/маршрут) для запуска вручную.

### Вне scope
- DRM, выбор качества вручную, субтитры, PiP, кэширование, фоновое воспроизведение.
- Готовый продакшн-UI (используем голый `video_player`, без `chewie`).
- Прод-конфигурация HTTPS (только локальный тест).

## 4. Зависимости
- Добавить в `pubspec.yaml` через `flutter pub add video_player` (предпочтительно — берётся актуальная версия), не хардкодить устаревшую версию вручную.
- Других пакетов не добавлять.

## 5. Конфигурация Android (обязательно)

Без этого поток по `http://10.0.2.2:8080` не загрузится — Android по умолчанию блокирует cleartext.

**5.1.** Создать `android/app/src/main/res/xml/network_security_config.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config cleartextTrafficPermitted="true">
        <domain includeSubdomains="false">10.0.2.2</domain>
    </domain-config>
</network-security-config>
```

**5.2.** В `android/app/src/main/AndroidManifest.xml`:
- Убедиться, что есть разрешение `<uses-permission android:name="android.permission.INTERNET"/>` (вне тега `<application>`).
- В теге `<application>` добавить атрибут `android:networkSecurityConfig="@xml/network_security_config"`.

> Примечание: использовать именно `network_security_config` с ограничением домена `10.0.2.2`, а не глобальный `android:usesCleartextTraffic="true"` — так разрешение не утечёт в прод.

## 6. Конфигурация iOS (опционально, только если будут тестировать на iOS-симуляторе)
В `ios/Runner/Info.plist` добавить исключение ATS. На iOS-симуляторе хост-localhost доступен как `localhost`/`127.0.0.1`, а не `10.0.2.2`, — учесть при формировании URL для iOS.

```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
</dict>
```

## 7. Конфигурация приложения
Завести единое место для настроек теста (например, `lib/config/stream_config.dart` или константы в экране):
- `baseUrl` — по умолчанию `http://10.0.2.2:8080`.
- `contentUuid` — задаётся через поле ввода на экране (см. п. 8), значение по умолчанию можно вынести в константу.
- Итоговый URL плеера собирается как: `"$baseUrl/stream/$contentUuid/master.m3u8"`.

## 8. Экран `TestPlayerScreen`

**Расположение:** `lib/screens/test_player_screen.dart` (StatefulWidget).

**Требования к поведению:**
1. Текстовое поле ввода `contentUuid` и кнопка «Загрузить» — чтобы менять контент без перезапуска.
2. По нажатию «Загрузить»:
   - корректно освободить предыдущий контроллер, если он был (`dispose`);
   - создать `VideoPlayerController.networkUrl(Uri.parse(url))`;
   - показать индикатор загрузки во время `initialize()`;
   - при ошибке `initialize()` — показать текст ошибки и не падать.
3. После успешной инициализации:
   - отрисовать видео в `AspectRatio` по `controller.value.aspectRatio`;
   - кнопка Play/Pause (FloatingActionButton или IconButton), переключающая `play()`/`pause()`;
   - `VideoProgressIndicator(controller, allowScrubbing: true)` для перемотки и прогресса.
4. В `dispose()` экрана обязательно освобождать контроллер.
5. Состояния UI: idle (нет контроллера) → loading → playing/paused → error.

**Референс-скелет (агент может доработать):**

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TestPlayerScreen extends StatefulWidget {
  const TestPlayerScreen({super.key});
  @override
  State<TestPlayerScreen> createState() => _TestPlayerScreenState();
}

class _TestPlayerScreenState extends State<TestPlayerScreen> {
  static const String baseUrl = 'http://10.0.2.2:8080';
  final _uuidController = TextEditingController(text: 'PUT_TEST_UUID_HERE');

  VideoPlayerController? _controller;
  bool _loading = false;
  String? _error;

  Future<void> _load() async {
    final uuid = _uuidController.text.trim();
    if (uuid.isEmpty) return;
    final url = '$baseUrl/stream/$uuid/master.m3u8';

    await _controller?.dispose();
    setState(() {
      _loading = true;
      _error = null;
      _controller = null;
    });

    final c = VideoPlayerController.networkUrl(Uri.parse(url));
    try {
      await c.initialize();
      c.addListener(() => setState(() {})); // обновление UI play/pause
      setState(() {
        _controller = c;
        _loading = false;
      });
      await c.play();
    } catch (e) {
      await c.dispose();
      setState(() {
        _loading = false;
        _error = 'Не удалось загрузить поток: $e';
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _uuidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _controller;
    return Scaffold(
      appBar: AppBar(title: const Text('HLS Test Player')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _uuidController,
              decoration: const InputDecoration(labelText: 'contentUuid'),
            ),
            const SizedBox(height: 8),
            FilledButton(onPressed: _loading ? null : _load, child: const Text('Загрузить')),
            const SizedBox(height: 16),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            if (c != null && c.value.isInitialized) ...[
              AspectRatio(aspectRatio: c.value.aspectRatio, child: VideoPlayer(c)),
              VideoProgressIndicator(c, allowScrubbing: true),
              IconButton(
                iconSize: 48,
                icon: Icon(c.value.isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () => c.value.isPlaying ? c.pause() : c.play(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

## 9. Точка входа
Добавить навигацию на `TestPlayerScreen` (кнопка на главном экране или временный маршрут `/test-player`), чтобы экран можно было открыть вручную при тестировании.

## 10. Критерии приёмки
- `flutter pub get` проходит без ошибок; проект собирается под Android.
- На Android-эмуляторе при валидном `contentUuid` поток `http://10.0.2.2:8080/stream/{uuid}/master.m3u8` воспроизводится.
- Работают Play/Pause и перемотка через прогресс-бар.
- При недоступном сервере / неверном UUID показывается сообщение об ошибке, приложение не крашится.
- При уходе с экрана контроллер освобождается (нет утечек, нет фонового звука).
- Cleartext-разрешение ограничено доменом `10.0.2.2` (нет глобального `usesCleartextTraffic`).

## 11. Примечания для агента
- Если эндпоинт сегментов требует HTTP-заголовки (авторизация/токен) — заложить возможность передать `httpHeaders` в `VideoPlayerController.networkUrl(...)`; заголовки применяются и к манифесту, и к TS-сегментам. На данном этапе считаем, что авторизация не нужна.
- Версию `video_player` не фиксировать вручную старой — ставить актуальную с pub.dev.
- Не подключать `chewie`/иные плееры в рамках этой задачи.