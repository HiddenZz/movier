import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/navigator/app_navigator.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/common/util/error_util.dart';
import 'package:movier/feature/player/controller/media_controller.dart';
import 'package:movier/feature/player/widget/fullscreen.dart';
import 'package:movier/feature/player/widget/player_controls.dart';
import 'package:movier/feature/player/widget/player_gesture_detector.dart';
import 'package:movier/feature/player/widget/player_gesture_feedback.dart';
import 'package:screen_brightness/screen_brightness.dart';

/// {@template player_view}
/// Video surface with the controls overlay and the gesture layer on top.
///
/// {@endtemplate}
class PlayerView extends StatefulWidget {
  /// {@macro player_view}
  const PlayerView({required this.contentUuid, required this.title, super.key});

  final String contentUuid;
  final String? title;

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  static const Duration _seekStep = Duration(seconds: 10);
  static const Duration _feedbackDuration = Duration(milliseconds: 600);
  static const Duration _controlsTimeout = Duration(seconds: 3);

  /// Span a full-width horizontal swipe covers, capped for long content.
  static const Duration _maxScrubSpan = Duration(minutes: 10);

  late final MediaController mediaController;

  bool _fullscreen = false;
  bool _controlsVisible = true;
  Timer? _controlsTimer;

  /// Set while a horizontal drag owns the position, so the seek bar follows
  /// the finger instead of the incoming position ticks.
  Duration? _scrubPosition;

  ({PlayerSide side, int seconds})? _seekFeedback;
  Timer? _seekFeedbackTimer;

  ({IconData icon, double value})? _valueFeedback;
  double _brightness = 0;
  double _volume = 100;
  bool _brightnessTouched = false;

  Player get _player => mediaController.player;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    mediaController = context.scops.player.mediaController;
    mediaController.load(widget.contentUuid);

    _restartControlsTimer();
  }

  @override
  void dispose() {
    _controlsTimer?.cancel();
    _seekFeedbackTimer?.cancel();
    // Leaving straight from fullscreen must not strand the app in landscape.
    if (_fullscreen) unawaited($exitPlayerFullscreen());
    if (_brightnessTouched) unawaited(ScreenBrightness().resetApplicationScreenBrightness().catchError((_) {}));

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: !_fullscreen,
    onPopInvokedWithResult: _onPopInvoked,
    child: ColoredBox(
      color: PlayerTheme.of(context).background,
      child: ListenableBuilder(
        listenable: mediaController,
        builder: (context, _) => switch (mediaController.state) {
          Failure$MediaState(:final error?) => _Failure(
            error: error,
            onRetry: () => mediaController.load(widget.contentUuid),
          ),
          final state => Stack(
            fit: StackFit.expand,
            children: [
              Video(controller: mediaController.videoController, controls: null),
              PlayerGestureDetector(
                onTap: _toggleControls,
                onDoubleTap: _onDoubleTap,
                onScrubStart: _onScrubStart,
                onScrubUpdate: _onScrubUpdate,
                onScrubEnd: _onScrubEnd,
                onVerticalDragStart: _onVerticalDragStart,
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                child: const SizedBox.expand(),
              ),
              ?switch (_seekFeedback) {
                final feedback? => PlayerSeekFeedback(side: feedback.side, seconds: feedback.seconds),
                _ => null,
              },
              ?switch (_valueFeedback) {
                final feedback? => PlayerValueFeedback(icon: feedback.icon, value: feedback.value),
                _ => null,
              },
              PlayerControls(
                contentUuid: widget.contentUuid,
                title: widget.title,
                state: state,
                player: _player,
                visible: _controlsVisible,
                fullscreen: _fullscreen,
                scrubPosition: _scrubPosition,
                scrubbing: _scrubPosition != null,
                onInteraction: _restartControlsTimer,
                onToggleFullscreen: _toggleFullscreen,
                onClose: () => AppNavigator.pop(context),
                onSeek: (position) => unawaited(_player.seek(_clamp(position))),
              ),
            ],
          ),
        },
      ),
    ),
  );

  void _restartControlsTimer() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(_controlsTimeout, () {
      if (mounted) setState(() => _controlsVisible = false);
    });
  }

  void _toggleControls() {
    setState(() => _controlsVisible = !_controlsVisible);
    if (_controlsVisible) _restartControlsTimer();
  }

  Duration _clamp(Duration position) => switch (position) {
    final value when value < Duration.zero => Duration.zero,
    final value when value > _player.state.duration => _player.state.duration,
    final value => value,
  };

  Future<void> _toggleFullscreen() async {
    final next = !_fullscreen;
    setState(() => _fullscreen = next);
    await (next ? $enterPlayerFullscreen() : $exitPlayerFullscreen());
  }

  void _onDoubleTap(PlayerSide side, int count) {
    final offset = _seekStep * count;
    final target = _clamp(switch (side) {
      PlayerSide.left => _player.state.position - offset,
      PlayerSide.right => _player.state.position + offset,
    });

    unawaited(_player.seek(target));

    setState(() => _seekFeedback = (side: side, seconds: offset.inSeconds));
    _seekFeedbackTimer?.cancel();
    _seekFeedbackTimer = Timer(_feedbackDuration, () {
      if (mounted) setState(() => _seekFeedback = null);
    });
  }

  void _onScrubStart() {
    _controlsTimer?.cancel();
    setState(() {
      _controlsVisible = true;
      _scrubPosition = _player.state.position;
    });
  }

  void _onScrubUpdate(double fraction) {
    final duration = _player.state.duration;
    if (duration == Duration.zero) return;
    final span = duration < _maxScrubSpan ? duration : _maxScrubSpan;

    setState(() => _scrubPosition = _clamp((_scrubPosition ?? _player.state.position) + span * fraction));
  }

  void _onScrubEnd() {
    final target = _scrubPosition;
    setState(() => _scrubPosition = null);
    _restartControlsTimer();
    if (target != null) unawaited(_player.seek(target));
  }

  Future<void> _onVerticalDragStart(PlayerSide side) async {
    switch (side) {
      case PlayerSide.left:
        _brightness = await ScreenBrightness().application.catchError((_) => 0.0);
        if (!mounted) return;
        setState(() => _valueFeedback = (icon: Icons.brightness_6_outlined, value: _brightness));
      case PlayerSide.right:
        _volume = _player.state.volume;
        setState(() => _valueFeedback = (icon: Icons.volume_up_outlined, value: _volume / 100));
    }
  }

  void _onVerticalDragUpdate(PlayerSide side, double fraction) {
    switch (side) {
      case PlayerSide.left:
        _brightness = (_brightness + fraction).clamp(0.0, 1.0);
        _brightnessTouched = true;
        unawaited(ScreenBrightness().setApplicationScreenBrightness(_brightness).catchError((_) {}));
        setState(() => _valueFeedback = (icon: Icons.brightness_6_outlined, value: _brightness));
      case PlayerSide.right:
        _volume = (_volume + fraction * 100).clamp(0.0, 100.0);
        unawaited(_player.setVolume(_volume));
        setState(() => _valueFeedback = (icon: Icons.volume_up_outlined, value: _volume / 100));
    }
  }

  void _onVerticalDragEnd() => setState(() => _valueFeedback = null);

  void _onPopInvoked(bool didPop, Object? result) {
    if (didPop || !_fullscreen) return;
    unawaited(_toggleFullscreen());
  }
}

class _Failure extends StatelessWidget {
  const _Failure({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Icon(Icons.error_outline, color: theme.foreground, size: 40),
            Text(
              ErrorUtil.errorToString(error, context.l10n),
              textAlign: TextAlign.center,
              style: context.thm.textTheme.bodyLarge?.copyWith(color: theme.foreground),
            ),
            OutlinedButton(
              onPressed: onRetry,
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.foreground,
                side: BorderSide(color: theme.foregroundMuted),
              ),
              child: Text(context.l10n.playerRetry),
            ),
          ],
        ),
      ),
    );
  }
}
