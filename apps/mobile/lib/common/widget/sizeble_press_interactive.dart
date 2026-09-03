import 'package:flutter/material.dart';
import 'package:motor/motor.dart';

class SizeblePressInteractive extends StatefulWidget {
  const SizeblePressInteractive({super.key, required this.child});

  final Widget child;

  @override
  State<SizeblePressInteractive> createState() => _SizeblePressInteractiveState();
}

class _SizeblePressInteractiveState extends State<SizeblePressInteractive> {
  final statesController = WidgetStatesController();

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: statesController,
    builder: (context, value, child) => SingleMotionBuilder(
      motion: MaterialSpringMotion.standardEffectsDefault(),
      value: switch (value) {
        final v when v.contains(WidgetState.pressed) => 1.2,
        _ => 1,
      },
      builder: (context, value, _) => Transform.scale(
        scale: value,
        child: Listener(
          onPointerDown: (event) {
            statesController.update(WidgetState.pressed, true);
          },
          onPointerUp: (event) {
            statesController.update(WidgetState.pressed, false);
          },
          child: widget.child,
        ),
      ),
    ),
  );
}
