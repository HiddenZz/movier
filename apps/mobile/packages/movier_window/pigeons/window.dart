import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    swiftOut: 'macos/Classes/Messages.g.swift',
    dartPackageName: 'movier_window',
  ),
)
/// Dart -> native. Requests are one-way: the actual state only ever comes
/// back through [WindowFullscreenFlutterApi], because the system can leave
/// fullscreen behind the app's back.
@HostApi()
abstract class WindowFullscreenHostApi {
  /// The window's actual fullscreen state right now, read directly instead
  /// of assumed — a hot restart resets Dart state, not the window.
  bool isFullscreen();

  /// Requests entering or leaving fullscreen.
  ///
  /// Returns whether a transition was actually started. `false` when one is
  /// already in progress (macOS ignores `toggleFullScreen` mid-animation) or
  /// the window is already in the requested state — in both cases no
  /// [WindowFullscreenFlutterApi.onFullscreenChanged] callback will follow.
  bool setFullscreen(bool fullscreen);
}

/// Native -> Dart. The only source of truth for the window's fullscreen
/// state, whether the transition was requested by the app or by the system.
@FlutterApi()
abstract class WindowFullscreenFlutterApi {
  void onFullscreenChanged(bool fullscreen);
}
