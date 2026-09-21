import 'package:flutter/foundation.dart';

/// What the host platform lets the app do.
///
/// Single point where platform differences are resolved, so feature code asks
/// about a capability instead of branching on the platform itself. Built from
/// [defaultTargetPlatform] rather than `dart:io`, which does not compile for
/// the web target.
final class PlatformCapabilities {
  const PlatformCapabilities({
    required this.supportsOrientationLock,
    required this.supportsScreenBrightness,
    required this.usesPointerInput,
    required this.interceptsBackInFullscreen,
  });

  /// Capabilities of the platform the app is currently running on.
  factory PlatformCapabilities.current() => switch (defaultTargetPlatform) {
    TargetPlatform.android || TargetPlatform.iOS => const PlatformCapabilities(
      supportsOrientationLock: true,
      supportsScreenBrightness: true,
      usesPointerInput: false,
      interceptsBackInFullscreen: true,
    ),
    _ => const PlatformCapabilities(
      supportsOrientationLock: false,
      supportsScreenBrightness: false,
      usesPointerInput: true,
      interceptsBackInFullscreen: false,
    ),
  };

  /// Whether `SystemChrome.setPreferredOrientations` has any effect. Desktop
  /// windows are resized by the user, not by the app.
  final bool supportsOrientationLock;

  /// Whether `screen_brightness` can read and set the application brightness.
  /// macOS only exposes the system brightness, so the player's brightness
  /// gesture has nothing to drive there.
  final bool supportsScreenBrightness;

  /// Whether input comes from a mouse and keyboard rather than touch.
  final bool usesPointerInput;

  /// Whether the player's back gesture/button should exit fullscreen instead
  /// of leaving the screen. On macOS, `Esc` already exits native fullscreen
  /// by itself, so the player must not intercept the second one.
  final bool interceptsBackInFullscreen;
}
