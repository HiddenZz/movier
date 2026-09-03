import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:motor/motor.dart';

class MotionSize extends StatefulWidget {
  const MotionSize({
    required this.child,
    required this.visible,
    required this.motion,
    super.key,
    this.onHidden,
  });

  final Widget child;
  final bool visible;
  final Motion motion;
  final VoidCallback? onHidden;

  @override
  State<MotionSize> createState() => _MotionSizeState();
}

class _MotionSizeState extends State<MotionSize> {
  double _naturalHeight = 0;

  void _onHeightChanged(double height) {
    if (height == _naturalHeight) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _naturalHeight = height);
    });
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status.isDismissed && !widget.visible) widget.onHidden?.call();
  }

  @override
  Widget build(BuildContext context) {
    final target = widget.visible ? _naturalHeight : 0.0;
    return SingleMotionBuilder(
      value: target,
      from: 0,
      motion: widget.motion,
      onAnimationStatusChanged: _onAnimationStatusChanged,
      builder: (context, height, child) =>
          _ClipToHeight(height: height, onMeasured: _onHeightChanged, child: child!),
      child: widget.child,
    );
  }
}

class _ClipToHeight extends SingleChildRenderObjectWidget {
  const _ClipToHeight({required this.height, required this.onMeasured, required Widget super.child});

  final double height;
  final ValueChanged<double> onMeasured;

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderClipToHeight(height, onMeasured);

  @override
  void updateRenderObject(BuildContext context, _RenderClipToHeight renderObject) {
    renderObject
      ..height = height
      ..onMeasured = onMeasured;
  }
}

class _RenderClipToHeight extends RenderProxyBox {
  _RenderClipToHeight(this._height, this.onMeasured);

  double _height;
  ValueChanged<double> onMeasured;
  double _lastMeasured = -1;

  double get height => _height;
  set height(double value) {
    if (_height == value) return;
    _height = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.constrain(Size(0, _height));
      return;
    }
    child!.layout(
      BoxConstraints(
        minWidth: constraints.minWidth,
        maxWidth: constraints.maxWidth,
        maxHeight: double.infinity,
      ),
      parentUsesSize: true,
    );
    final natural = child!.size.height;
    final width = child!.size.width;
    if (natural != _lastMeasured) {
      _lastMeasured = natural;
      WidgetsBinding.instance.addPostFrameCallback((_) => onMeasured(natural));
    }
    if (_height > natural) {
      child!.layout(
        BoxConstraints(
          minWidth: constraints.minWidth,
          maxWidth: constraints.maxWidth,
          minHeight: _height,
          maxHeight: double.infinity,
        ),
        parentUsesSize: true,
      );
    }
    size = constraints.constrain(Size(width, _height));
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (position.dy < 0 || position.dy > size.height) return false;
    return super.hitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    context.pushClipRect(
      needsCompositing,
      offset,
      Offset.zero & size,
      (ctx, o) => ctx.paintChild(child!, o),
    );
  }
}
