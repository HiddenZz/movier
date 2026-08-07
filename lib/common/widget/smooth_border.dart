import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/smooth_border_theme.dart';

class SmoothBorder extends StatelessWidget {
  const SmoothBorder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: switch (context.thm.smoothBorder?.borderRadius) {
      final double? => BorderRadius.circular(double),
      _ => BorderRadius.zero,
    },
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: switch (context.thm.smoothBorder) {
          SmoothBorderThemeData(:final color?, :final strokeWidth?)? => Border.all(color: color, width: strokeWidth),
          _ => null,
        },
        borderRadius: switch (context.thm.smoothBorder?.borderRadius) {
          final double? => BorderRadius.circular(double),
          _ => null,
        },
      ),
      child: child,
    ),
  );
}
