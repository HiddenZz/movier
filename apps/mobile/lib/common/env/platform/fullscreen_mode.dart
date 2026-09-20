import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:movier_window/movier_window.dart';

/// Fullscreen mode of the player surface.
///
/// The value is the *actual* state, not the requested one: on desktop the
/// user can leave fullscreen past the app (green button, Mission Control,
/// Ctrl+Cmd+F, Esc), and the window reports it back.
abstract interface class FullscreenMode implements ValueListenable<bool> {
  /// Picks the implementation for the platform the app is currently running
  /// on. The only `switch` on platform for this feature — everything else
  /// reads [FullscreenMode], never the platform directly.
  factory FullscreenMode.current() => switch (defaultTargetPlatform) {
    TargetPlatform.android || TargetPlatform.iOS => _SystemChromeFullscreen(),
    TargetPlatform.macOS => _WindowFullscreen(),
    _ => _NoopFullscreen(),
  };

  Future<void> enter();
  Future<void> exit();
  Future<void> toggle();
  void dispose();
}

/// Mobile: `SystemChrome` has no callback for the state it sets, so the app
/// is the source of truth and writes [value] optimistically.
class _SystemChromeFullscreen extends ValueNotifier<bool> implements FullscreenMode {
  _SystemChromeFullscreen() : super(false);

  @override
  Future<void> enter() async {
    value = true;
    await Future.wait(<Future<void>>[
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: const <SystemUiOverlay>[]),
      SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    ]);
  }

  @override
  Future<void> exit() async {
    value = false;
    await Future.wait(<Future<void>>[
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values),
      SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);
  }

  @override
  Future<void> toggle() => value ? exit() : enter();

  @override
  void dispose() {
    // Leaving the screen mid-fullscreen must not strand the app in landscape
    // with the system bars hidden.
    if (value) exit().ignore();
    super.dispose();
  }
}

/// macOS: the window can leave fullscreen behind the app's back, so [value]
/// only ever moves from `movier_window`'s native callback — [enter], [exit]
/// and [toggle] just ask.
class _WindowFullscreen extends ValueNotifier<bool> implements FullscreenMode {
  _WindowFullscreen() : super(false) {
    _window = MovierWindow(onFullscreenChanged: (fullscreen) => value = fullscreen);
    // Dart state resets on hot restart, the window does not.
    unawaited(_window.isFullscreen().then((fullscreen) => value = fullscreen));
  }

  late final MovierWindow _window;

  @override
  Future<void> enter() => _request(fullscreen: true);

  @override
  Future<void> exit() => _request(fullscreen: false);

  @override
  Future<void> toggle() => _request(fullscreen: !value);

  /// Fire-and-forget: a `false` result means the window ignored the request
  /// (mid-transition, or already in that state), and there is nothing to
  /// roll back — [value] was never written optimistically.
  Future<void> _request({required bool fullscreen}) async {
    if (value == fullscreen) return;
    await _window.setFullscreen(fullscreen: fullscreen);
  }

  @override
  void dispose() {
    // Leaving the player screen mid-fullscreen must not strand the window.
    // [exit] never touches `value` on this implementation — a notifier must
    // not notify listeners once `super.dispose()` below has run.
    if (value) exit().ignore();
    _window.dispose();
    super.dispose();
  }
}

/// Web and other targets: fullscreen has no meaning here, but the factory
/// must return something.
class _NoopFullscreen extends ValueNotifier<bool> implements FullscreenMode {
  _NoopFullscreen() : super(false);

  @override
  Future<void> enter() async {}

  @override
  Future<void> exit() async {}

  @override
  Future<void> toggle() async {}
}
