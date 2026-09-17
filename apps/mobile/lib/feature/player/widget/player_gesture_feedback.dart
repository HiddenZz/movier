import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/feature/player/widget/player_gesture_detector.dart';

/// Transient "+10 sec" badge shown on the half of the screen that was tapped.
class PlayerSeekFeedback extends StatelessWidget {
  const PlayerSeekFeedback({required this.side, required this.seconds, super.key});

  final PlayerSide side;

  /// Accumulated amount of the current double tap burst, in seconds.
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Align(
      alignment: switch (side) {
        PlayerSide.left => Alignment.centerLeft,
        PlayerSide.right => Alignment.centerRight,
      },
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: DecoratedBox(
          decoration: BoxDecoration(color: theme.scrim, shape: BoxShape.rectangle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Icon(
                switch (side) {
                  PlayerSide.left => Icons.fast_rewind_rounded,
                  PlayerSide.right => Icons.fast_forward_rounded,
                },
                color: theme.foreground,
                size: 36,
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
