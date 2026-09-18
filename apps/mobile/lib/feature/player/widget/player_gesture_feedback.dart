import 'package:flutter/material.dart';
import 'package:motor/motor.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/feature/player/widget/player_gesture_detector.dart';

/// Transient "+10 sec" badge shown on the half of the screen that was tapped.
///
/// Fades and scales itself in and out, so the caller only ever passes the
/// current value of the double tap burst, or null once it has ended.
class PlayerSeekFeedback extends StatefulWidget {
  const PlayerSeekFeedback({required this.feedback, super.key});

  /// Side of the burst and the seconds it has accumulated. Null hides it.
  final ({PlayerSide side, int seconds})? feedback;

  @override
  State<PlayerSeekFeedback> createState() => _PlayerSeekFeedbackState();
}

class _PlayerSeekFeedbackState extends State<PlayerSeekFeedback> {
  /// Value the badge keeps drawing while it fades out, after the burst that
  /// produced it is already gone.
  ({PlayerSide side, int seconds})? _last;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    _last = widget.feedback;
  }

  @override
  void didUpdateWidget(PlayerSeekFeedback oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.feedback case final feedback?) _last = feedback;
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => SingleMotionBuilder(
    motion: MaterialSpringMotion.standardEffectsDefault(),
    value: widget.feedback != null ? 1 : 0,
    builder: (context, value, _) => switch (_last) {
      final last? when value > 0.01 => IgnorePointer(
        child: Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: .8 + .2 * value,
            child: _Badge(side: last.side, seconds: last.seconds),
          ),
        ),
      ),
      _ => const SizedBox.shrink(),
    },
  );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.side, required this.seconds});

  final PlayerSide side;

  /// Accumulated amount of the current double tap burst, in seconds.
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Align(
      // Centre of the half that was tapped: halfway between its outer edge
      // and the middle of the player.
      alignment: switch (side) {
        PlayerSide.left => const Alignment(-0.5, 0),
        PlayerSide.right => const Alignment(0.5, 0),
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.scrim,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Icon(
                switch (side) {
                  PlayerSide.left => Icons.fast_rewind_rounded,
                  PlayerSide.right => Icons.fast_forward_rounded,
                },
                color: theme.foreground,
                size: 28,
              ),
              Text(switch (side) {
                PlayerSide.left => '-$seconds',
                PlayerSide.right => '+$seconds',
              }, style: context.thm.textTheme.titleMedium?.copyWith(color: theme.foreground)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Centered readout for a vertical drag — brightness or volume.
class PlayerValueFeedback extends StatelessWidget {
  const PlayerValueFeedback({required this.icon, required this.value, super.key});

  final IconData icon;

  /// Normalized 0..1.
  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(color: theme.scrim, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(icon, color: theme.foreground, size: 28),
              SizedBox(
                width: 96,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    minHeight: 4,
                    value: value.clamp(0.0, 1.0),
                    backgroundColor: theme.progressTrack,
                    valueColor: AlwaysStoppedAnimation<Color>(theme.progress),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
