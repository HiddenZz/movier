import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:motor/motor.dart';
import 'package:movier/common/widget/motion_size.dart';

class TextFieldOverlayHelper extends StatefulWidget {
  const TextFieldOverlayHelper({
    required this.child,
    required this.textController,
    required this.focusNode,
    required this.contentBuilder,
    super.key,
    this.offset = Offset.zero,
    this.motion = const CupertinoMotion.smooth(duration: Durations.long1),
  });
  final Widget Function(Size size) contentBuilder;
  final TextEditingController textController;
  final FocusNode focusNode;
  final Offset offset;
  final Motion motion;
  final Widget child;

  @override
  State<TextFieldOverlayHelper> createState() => _AddressOverlayState();
}

class _AddressOverlayState extends State<TextFieldOverlayHelper>
    with
        SingleTickerProviderStateMixin<TextFieldOverlayHelper>,
        _AddressOverlayApiMixin,
        _AddressOverlayBuilderMixin,
        _OverlayMixin {}

mixin _AddressOverlayApiMixin on State<TextFieldOverlayHelper> {
  @mustCallSuper
  OverlayEntry? _overlayEntry;

  @mustCallSuper
  @visibleForTesting
  @visibleForOverriding
  void show() {}

  @mustCallSuper
  @visibleForTesting
  @visibleForOverriding
  void hide() {}
}

mixin _AddressOverlayBuilderMixin on _AddressOverlayApiMixin {
  double _lastKeyboardHeight = 0;

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(_syncVisibility);
    widget.focusNode.addListener(_syncVisibility);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentKeyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (_overlayEntry != null && currentKeyboardHeight != _lastKeyboardHeight) {
      _lastKeyboardHeight = currentKeyboardHeight;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _overlayEntry?.markNeedsBuild();
      });
    }
  }

  @override
  void dispose() {
    widget.textController.removeListener(_syncVisibility);
    widget.focusNode.removeListener(_syncVisibility);
    super.dispose();
  }

  void _syncVisibility() {
    final shouldShow = widget.textController.text.isNotEmpty && widget.focusNode.hasFocus;
    if (shouldShow) {
      show();
    } else if (!shouldShow) {
      hide();
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

mixin _OverlayMixin on _AddressOverlayApiMixin, SingleTickerProviderStateMixin<TextFieldOverlayHelper> {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _boundaryKey = GlobalKey();
  late final ValueNotifier<bool> _visible = ValueNotifier(false);
  ui.Image? _snapshot;
  Size? _snapshotSize;

  @override
  void show() {
    super.show();
    if (!mounted) return;
    _disposeSnapshot();
    if (_overlayEntry == null) {
      Overlay.of(context).insert(super._overlayEntry = OverlayEntry(builder: _buildOverlay));
    } else {
      _overlayEntry!.markNeedsBuild();
    }
    _visible.value = true;
  }

  @override
  void hide() {
    super.hide();
    if (_overlayEntry == null) return;
    _captureSnapshot();
    _visible.value = false;
  }

  void _captureSnapshot() {
    final boundary = _boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null || boundary.debugNeedsPaint) return;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _disposeSnapshot();
    _snapshot = boundary.toImageSync(pixelRatio: pixelRatio);
    _snapshotSize = boundary.size;
  }

  void _disposeSnapshot() {
    _snapshot?.dispose();
    _snapshot = null;
    _snapshotSize = null;
  }

  void _onHidden() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _disposeSnapshot();
  }

  Widget _buildOverlay(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;

    final renderBox = super.context.findRenderObject() as RenderBox?;
    final textFieldPosition = renderBox?.localToGlobal(Offset.zero);
    final textFieldHeight = renderBox?.size.height ?? 0;
    final textFieldWidth = renderBox?.size.width ?? 0;

    final textFieldBottom = (textFieldPosition?.dy ?? 0) + textFieldHeight;
    final keyboardTop = screenHeight - keyboardHeight;
    final availableSpace = keyboardTop - textFieldBottom - widget.offset.dy - 16;

    final size = Size(textFieldWidth, availableSpace.clamp(100.0, 500.0));

    return Positioned(
      left: textFieldPosition?.dx ?? 0,
      child: CompositedTransformFollower(
        link: _layerLink,
        offset: widget.offset,
        targetAnchor: Alignment.bottomCenter,
        followerAnchor: Alignment.topCenter,
        showWhenUnlinked: false,
        child: ListenableBuilder(
          listenable: _visible,
          builder: (context, _) {
            final showSnapshot = !_visible.value && _snapshot != null;
            final Widget content = showSnapshot
                ? SizedBox(
                    width: _snapshotSize!.width,
                    height: _snapshotSize!.height,
                    child: RawImage(image: _snapshot, fit: BoxFit.fill),
                  )
                : RepaintBoundary(key: _boundaryKey, child: widget.contentBuilder(size));
            return MotionSize(visible: _visible.value, motion: widget.motion, onHidden: _onHidden, child: content);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _disposeSnapshot();
    _visible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(link: _layerLink, child: super.build(context));
}
