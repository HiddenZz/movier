import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';

class SmoothBorderTheme extends InheritedTheme {
  final SmoothBorderThemeData data;

  const SmoothBorderTheme({required this.data, required super.child, super.key});

  static SmoothBorderThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<SmoothBorderTheme>();
    return inheritedTheme?.data ?? context.thm.theme.extension<SmoothBorderThemeData>()!;
  }

  @override
  bool updateShouldNotify(SmoothBorderTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SmoothBorderTheme(data: data, child: child);
  }
}

class SmoothBorderThemeData extends ThemeExtension<SmoothBorderThemeData> {
  const SmoothBorderThemeData({this.color, this.strokeWidth = 1, this.borderRadius = 24});
  final Color? color;
  final double? strokeWidth;
  final double? borderRadius;

  @override
  SmoothBorderThemeData copyWith({Color? color, double? strokeWidth, double? borderRadius}) => SmoothBorderThemeData(
    color: color ?? this.color,
    strokeWidth: strokeWidth ?? this.strokeWidth,
    borderRadius: borderRadius ?? this.borderRadius,
  );

  @override
  SmoothBorderThemeData lerp(covariant SmoothBorderThemeData? other, double t) {
    if (other == null) return this;

    return SmoothBorderThemeData(
      color: Color.lerp(color, other.color, t),
      strokeWidth: lerpDouble(strokeWidth, other.strokeWidth, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}
