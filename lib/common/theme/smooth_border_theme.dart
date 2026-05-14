import 'dart:ui';

import 'package:flutter/material.dart';

class SmoothBorderTheme extends ThemeExtension<SmoothBorderTheme> {
  const SmoothBorderTheme({this.color, this.strokeWidth = 1, this.borderRadius = 24});
  final Color? color;
  final double? strokeWidth;
  final double? borderRadius;

  @override
  SmoothBorderTheme copyWith({Color? color, double? strokeWidth, double? borderRadius}) => SmoothBorderTheme(
    color: color ?? this.color,
    strokeWidth: strokeWidth ?? this.strokeWidth,
    borderRadius: borderRadius ?? this.borderRadius,
  );

  @override
  SmoothBorderTheme lerp(covariant SmoothBorderTheme? other, double t) {
    if (other == null) return this;

    return SmoothBorderTheme(
      color: Color.lerp(color, other.color, t),
      strokeWidth: lerpDouble(strokeWidth, other.strokeWidth, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}
