import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:movier/common/env/platform/fullscreen_mode.dart';
import 'package:movier/common/env/platform_capabilities.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/navigator/app_navigator.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/common/util/error_util.dart';
import 'package:movier/feature/player/controller/media_controller.dart';
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
  late final FullscreenMode fullscreen;
  late final bool _interceptsBackInFullscreen;

  /// Controls overlay visibility, auto-hidden after [_controlsTimeout].
  final ValueNotifier<bool> _controlsVisible = ValueNotifier(true);
  Timer? _controlsTimer;

  /// Set while a horizontal drag owns the position, so the seek bar follows
  /// the finger instead of the incoming position ticks.
  Duration? _scrubPosition;

  /// Double-tap seek hint, shown while the burst accumulates. Taking it down
  /// and applying the seek are the same moment — see [_commitBurst].
  final ValueNotifier<({PlayerSide side, int seconds})?> _seekFeedback = ValueNotifier(null);
  Timer? _seekFeedbackTimer;

  /// Position the current double-tap burst seeks from, captured on its first
  /// tap. Every tap of the burst offsets this base instead of the live
  /// position, which lags behind the pending seeks. Null when no burst is
  /// running.
  Duration? _seekBase;

  /// Where the burst has seeked to so far. Held back until it ends, so a run
  /// of taps costs the player a single seek instead of one per tap.
  Duration? _pendingSeek;

  /// Brightness/volume hint, shown while a vertical drag is in progress.
  final ValueNotifier<({IconData icon, double value})?> _valueFeedback = ValueNotifier(null);

  /// Current application brightness, primed in [initState]. A drag has to
  /// offset it on its very first frame, which leaves no room to await a read.
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
    fullscreen = context.scops.player.fullscreen;
    _interceptsBackInFullscreen = PlatformCapabilities.current().interceptsBackInFullscreen;

    _restartControlsTimer();
    unawaited(_primeBrightness());
  }

  /// Reads the screen brightness ahead of any gesture that needs it. A drag
  /// that got there first owns the value, so its result is dropped.
  Future<void> _primeBrightness() async {
    Future<double?> system() async {
      try {
        return await ScreenBrightness().application;
      } catch (_) {
        return null;
      }
    }

    final brightness = await system();
    if (!mounted || brightness == null || _brightnessTouched) return;
    _brightness = brightness;
  }

  @override
  void dispose() {
    _controlsTimer?.cancel();
    _seekFeedbackTimer?.cancel();
    // Leaving mid-burst must not swallow the seek it accumulated. Applied
    // directly: the notifiers below are about to go, so [_commitBurst] would
    // notify listeners that are already unmounting.
    if (_pendingSeek case final target?) _player.seek(target).ignore();
    _controlsVisible.dispose();
    _seekFeedback.dispose();
    _valueFeedback.dispose();
    if (_brightnessTouched) ScreenBrightness().resetApplicationScreenBrightness().ignore();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
    valueListenable: fullscreen,
    builder: (context, isFullscreen, child) => PopScope(
      canPop: !(_interceptsBackInFullscreen && isFullscreen),
      onPopInvokedWithResult: _onPopInvoked,
      child: child!,
    ),
    child: ColoredBox(
      color: PlayerTheme.of(context).background,
      child: ListenableBuilder(
        listenable: mediaController,
        builder: (context, _) => switch (mediaController.state) {
          Failure$MediaState(:final error?) => _Failure(
            error: error,
            onRetry: () => mediaController.load(widget.contentUuid),
          ),
          _ => Stack(
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
              ValueListenableBuilder(
                valueListenable: _seekFeedback,
                builder: (context, feedback, _) => PlayerSeekFeedback(feedback: feedback),
              ),
              ValueListenableBuilder(
                valueListenable: _valueFeedback,
                builder: (context, feedback, _) => switch (feedback) {
                  final value? => PlayerValueFeedback(icon: value.icon, value: value.value),
                  _ => const SizedBox.shrink(),
                },
              ),
              ValueListenableBuilder(
                valueListenable: _controlsVisible,
                builder: (context, visible, _) => PlayerControls(
                  contentUuid: widget.contentUuid,
                  title: widget.title,
                  player: _player,
                  visible: visible,
                  scrubPosition: _scrubPosition,
                  scrubbing: _scrubPosition != null,
                  onInteraction: _restartControlsTimer,
                  onClose: () => AppNavigator.pop(context),
                  onSeek: (position) {
                    _cancelBurst();
                    unawaited(_player.seek(_clamp(position)));
                  },
                ),
              ),
            ],
          ),
        },
      ),
    ),
  );

  void _restartControlsTimer() {
    _controlsTimer?.cancel();

    _controlsTimer = Timer(_controlsTimeout, () => _controlsVisible.value = false);
  }

  void _toggleControls() {
    final visible = !_controlsVisible.value;
    _controlsVisible.value = visible;
    if (visible) _restartControlsTimer();
  }

  Duration _clamp(Duration position) => switch (position) {
    final value when value < Duration.zero => Duration.zero,
    final value when value > _player.state.duration => _player.state.duration,
    final value => value,
  };

  void _onDoubleTap(PlayerSide side, int count) => _playerDurationGuard((duration) {
    // A burst that starts before the previous one was applied continues from
    // its target, which the player has not been told about yet.
    final base = (count == 1 ? null : _seekBase) ?? _pendingSeek ?? _player.state.position;
    _seekBase = base;

    final offset = _seekStep * count;
    _pendingSeek = _clamp(switch (side) {
      PlayerSide.left => base - offset,
      PlayerSide.right => base + offset,
    });

    _seekFeedback.value = (side: side, seconds: offset.inSeconds);
    _seekFeedbackTimer?.cancel();
    _seekFeedbackTimer = Timer(_feedbackDuration, _commitBurst);
  });

  /// Applies the position the burst accumulated and takes its hint down.
  void _commitBurst() {
    final target = _cancelBurst();
    if (target != null) _player.seek(target).ignore();
  }

  /// Drops the pending burst without seeking, returning the target it held.
  Duration? _cancelBurst() {
    final target = _pendingSeek;
    _seekFeedbackTimer?.cancel();
    _seekBase = null;
    _pendingSeek = null;
    _seekFeedback.value = null;

    return target;
  }

  void _onScrubStart() {
    _controlsTimer?.cancel();
    _controlsVisible.value = true;
    // The pending burst becomes the starting point of the scrub instead of
    // landing on top of it once its timer fires.
    final pending = _cancelBurst();
    setState(() => _scrubPosition = pending ?? _player.state.position);
  }

  void _onScrubUpdate(double fraction) => _playerDurationGuard((duration) {
    final span = duration < _maxScrubSpan ? duration : _maxScrubSpan;

    setState(() => _scrubPosition = _clamp((_scrubPosition ?? _player.state.position) + span * fraction));
  });

  void _onScrubEnd() {
    final target = _scrubPosition;
    setState(() => _scrubPosition = null);
    _restartControlsTimer();
    if (target != null) unawaited(_player.seek(target));
  }

  void _onVerticalDragStart(PlayerSide side) {
    switch (side) {
      case PlayerSide.left:
        _valueFeedback.value = (icon: Icons.brightness_6_outlined, value: _brightness);
      case PlayerSide.right:
        _volume = _player.state.volume;
        _valueFeedback.value = (icon: Icons.volume_up_outlined, value: _volume / 100);
    }
  }

  void _onVerticalDragUpdate(PlayerSide side, double fraction) {
    switch (side) {
      case PlayerSide.left:
        _brightness = (_brightness + fraction).clamp(0.0, 1.0);
        _brightnessTouched = true;
        ScreenBrightness().setApplicationScreenBrightness(_brightness).ignore();
        _valueFeedback.value = (icon: Icons.brightness_6_outlined, value: _brightness);
      case PlayerSide.right:
        _volume = (_volume + fraction * 100).clamp(0.0, 100.0);
        unawaited(_player.setVolume(_volume));
        _valueFeedback.value = (icon: Icons.volume_up_outlined, value: _volume / 100);
    }
  }

  void _onVerticalDragEnd() => _valueFeedback.value = null;

  void _onPopInvoked(bool didPop, Object? result) {
    if (didPop || !fullscreen.value) return;
    unawaited(fullscreen.exit());
  }

  void _playerDurationGuard(ValueSetter fn) {
    final duration = _player.state.duration;
    if (_player.state.duration == Duration.zero) return;
    fn(duration);
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
