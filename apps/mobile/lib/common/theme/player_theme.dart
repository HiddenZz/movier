import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';

/// Palette of the video player overlay.
///
/// The app theme is a light, warm one and reads badly on top of video, so the
/// player carries its own dark set of colors instead of borrowing the
/// [ColorScheme].
class PlayerTheme extends InheritedTheme {
  const PlayerTheme({required this.data, required super.child, super.key});

  final PlayerThemeData data;

  static PlayerThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<PlayerTheme>();
    return inheritedTheme?.data ?? context.thm.theme.extension<PlayerThemeData>()!;
  }

  @override
  bool updateShouldNotify(PlayerTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) => PlayerTheme(data: data, child: child);
}

class PlayerThemeData extends ThemeExtension<PlayerThemeData> {
  const PlayerThemeData({
    this.background = const Color(0xFF000000),
    this.scrim = const Color(0x30000000),
    this.foreground = const Color(0xFFFFFFFF),
    this.foregroundMuted = const Color(0xB3FFFFFF),
    this.progress = const Color(0xFF4A7C59),
    this.progressBuffer = const Color(0x66FFFFFF),
    this.progressTrack = const Color(0x33FFFFFF),
  });

  /// Behind the video texture.
  final Color background;

  /// Behind the controls, so they stay readable over a bright frame.
  final Color scrim;

  final Color foreground;
  final Color foregroundMuted;
  final Color progress;
  final Color progressBuffer;
  final Color progressTrack;

  @override
  PlayerThemeData copyWith({
    Color? background,
    Color? scrim,
    Color? foreground,
    Color? foregroundMuted,
    Color? progress,
    Color? progressBuffer,
    Color? progressTrack,
  }) => PlayerThemeData(
    background: background ?? this.background,
    scrim: scrim ?? this.scrim,
    foreground: foreground ?? this.foreground,
    foregroundMuted: foregroundMuted ?? this.foregroundMuted,
    progress: progress ?? this.progress,
    progressBuffer: progressBuffer ?? this.progressBuffer,
    progressTrack: progressTrack ?? this.progressTrack,
  );

  @override
  PlayerThemeData lerp(covariant PlayerThemeData? other, double t) {
    if (other == null) return this;

    return PlayerThemeData(
      background: Color.lerp(background, other.background, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      foregroundMuted: Color.lerp(foregroundMuted, other.foregroundMuted, t)!,
      progress: Color.lerp(progress, other.progress, t)!,
      progressBuffer: Color.lerp(progressBuffer, other.progressBuffer, t)!,
      progressTrack: Color.lerp(progressTrack, other.progressTrack, t)!,
    );
  }
}
