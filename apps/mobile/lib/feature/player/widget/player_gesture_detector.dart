import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Which half of the player a gesture started on.
enum PlayerSide { left, right }

/// Axis a pan was locked to on its first significant movement.
enum _PanAxis { horizontal, vertical }

/// Raw gesture layer of the player.
///
/// Taps are discriminated by hand rather than through `onTap` + `onDoubleTap`:
/// when both callbacks are registered, [GestureDetector] defers `onTap` by
/// [kDoubleTapTimeout], which makes toggling the controls feel sluggish. Here
/// the first tap arms a timer and the second tap inside the window cancels it,
/// so a double tap never pays for a single one.
///
/// Drags go through a single pan recognizer with an axis lock instead of
/// competing horizontal and vertical recognizers, which would fight in the
/// gesture arena and drop the first few pixels of movement.
class PlayerGestureDetector extends StatefulWidget {
  const PlayerGestureDetector({
    required this.child,
    required this.onTap,
    required this.onDoubleTap,
    required this.onScrubStart,
    required this.onScrubUpdate,
    required this.onScrubEnd,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    super.key,
  });

  final Widget child;

  /// A confirmed single tap — no second tap followed it.
  final VoidCallback onTap;

  /// A confirmed double tap, with the half of the screen it landed on and how
  /// many double taps have accumulated in the current burst (1, 2, 3, ...).
  final void Function(PlayerSide side, int count) onDoubleTap;

  final VoidCallback onScrubStart;

  /// Horizontal drag delta in logical pixels, relative to the full width.
  final void Function(double fraction) onScrubUpdate;

  final VoidCallback onScrubEnd;

  final void Function(PlayerSide side) onVerticalDragStart;

  /// Vertical drag delta as a fraction of the height, positive means up.
  final void Function(PlayerSide side, double fraction) onVerticalDragUpdate;

  final VoidCallback onVerticalDragEnd;

  @override
  State<PlayerGestureDetector> createState() => _PlayerGestureDetectorState();
}

class _PlayerGestureDetectorState extends State<PlayerGestureDetector> {
  /// Movement, in logical pixels, before a pan commits to an axis.
  static const double _axisLockSlop = 8;

  Timer? _singleTapTimer;
  Offset? _lastTapPosition;

  /// Consecutive double taps on the same side, reset when the burst ends.
  int _doubleTapCount = 0;
  PlayerSide? _doubleTapSide;

  _PanAxis? _panAxis;
  PlayerSide? _panSide;
  Offset _panOffset = Offset.zero;

  /* #region Lifecycle */
  @override
  void dispose() {
    _singleTapTimer?.cancel();
    super.dispose();
  }
  /* #endregion */

  PlayerSide _sideOf(Offset localPosition) =>
      localPosition.dx < context.size!.width / 2 ? PlayerSide.left : PlayerSide.right;

  void _onTapUp(TapUpDetails details) {
    final position = details.localPosition;
    final isDoubleTap = switch (_lastTapPosition) {
      final Offset previous when _singleTapTimer?.isActive ?? false => (position - previous).distance < kDoubleTapSlop,
      _ => false,
    };

    _singleTapTimer?.cancel();
    _lastTapPosition = position;

    if (!isDoubleTap) {
      // Might still turn into a double tap — defer the decision.
      _singleTapTimer = Timer(kDoubleTapTimeout, () {
        _doubleTapCount = 0;
        _doubleTapSide = null;
        widget.onTap();
      });
      return;
    }

    final side = _sideOf(position);
    _doubleTapCount = side == _doubleTapSide ? _doubleTapCount + 1 : 1;
    _doubleTapSide = side;
    widget.onDoubleTap(side, _doubleTapCount);

    // Keep the burst alive so a third tap accumulates instead of toggling.
    _singleTapTimer = Timer(kDoubleTapTimeout, () {
      _doubleTapCount = 0;
      _doubleTapSide = null;
    });
  }

  void _onPanStart(DragStartDetails details) {
    _panAxis = null;
    _panOffset = Offset.zero;
    _panSide = _sideOf(details.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _panOffset += details.delta;

    if (_panAxis == null) {
      if (_panOffset.distance < _axisLockSlop) return;
      _panAxis = _panOffset.dx.abs() > _panOffset.dy.abs() ? _PanAxis.horizontal : _PanAxis.vertical;
      switch (_panAxis) {
        case _PanAxis.horizontal:
          widget.onScrubStart();
        case _PanAxis.vertical:
          widget.onVerticalDragStart(_panSide!);
        case null:
          return;
      }
    }

    final size = context.size!;
    switch (_panAxis) {
      case _PanAxis.horizontal:
        widget.onScrubUpdate(details.delta.dx / size.width);
      case _PanAxis.vertical:
        // Screen coordinates grow downwards; a drag up must raise the value.
        widget.onVerticalDragUpdate(_panSide!, -details.delta.dy / size.height);
      case null:
        break;
    }
  }

  void _onPanEnd() {
    switch (_panAxis) {
      case _PanAxis.horizontal:
        widget.onScrubEnd();
      case _PanAxis.vertical:
        widget.onVerticalDragEnd();
      case null:
        break;
    }
    _panAxis = null;
    _panSide = null;
    _panOffset = Offset.zero;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTapUp: _onTapUp,
    onPanStart: _onPanStart,
    onPanUpdate: _onPanUpdate,
    onPanEnd: (_) => _onPanEnd(),
    onPanCancel: _onPanEnd,
    child: widget.child,
  );
}
