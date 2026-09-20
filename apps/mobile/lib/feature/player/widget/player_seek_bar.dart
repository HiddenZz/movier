import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:movier/common/theme/player_theme.dart';

/// Formats a duration as `h:mm:ss`, dropping the hours when there are none.
String $formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(Duration.minutesPerHour);
  final seconds = duration.inSeconds.remainder(Duration.secondsPerMinute);
  final mm = minutes.toString().padLeft(2, '0');
  final ss = seconds.toString().padLeft(2, '0');

  return hours > 0 ? '$hours:$mm:$ss' : '$mm:$ss';
}

/// Progress bar with a buffer track, driven straight off the player streams.
///
/// While the bar is dragged, or while [scrubPosition] is set by the gesture
/// layer, it follows the finger instead of the player, so a drag does not
/// fight with incoming position ticks.
class PlayerSeekBar extends StatefulWidget {
  const PlayerSeekBar({
    required this.player,
    required this.onSeek,
    required this.onInteraction,
    super.key,
    this.scrubPosition,
  });

  final Player player;
  final Duration? scrubPosition;
  final ValueChanged<Duration> onSeek;

  /// Called on every touch of the bar, so the controls stay up for the whole
  /// drag and not only until the auto-hide timer runs out.
  final VoidCallback onInteraction;

  @override
  State<PlayerSeekBar> createState() => _PlayerSeekBarState();
}

class _PlayerSeekBarState extends State<PlayerSeekBar> {
  /// Position the thumb is held at while the bar itself is dragged. Owns the
  /// displayed position for the whole drag, so position ticks cannot pull the
  /// thumb back from under the finger; the seek happens once, on release.
  Duration? _dragPosition;

  @override
  Widget build(BuildContext context) => StreamBuilder<Duration>(
    initialData: widget.player.state.duration,
    stream: widget.player.stream.duration,
    builder: (context, durationSnapshot) {
      final duration = durationSnapshot.data ?? Duration.zero;

      return StreamBuilder<Duration>(
        initialData: widget.player.state.position,
        stream: widget.player.stream.position,
        builder: (context, positionSnapshot) {
          final position = _dragPosition ?? widget.scrubPosition ?? positionSnapshot.data ?? Duration.zero;

          return Row(
            spacing: 12,
            children: [
              _Timestamp(value: position),
              Expanded(
                child: StreamBuilder<Duration>(
                  initialData: widget.player.state.buffer,
                  stream: widget.player.stream.buffer,
                  builder: (context, bufferSnapshot) => _Track(
                    position: position,
                    buffer: bufferSnapshot.data ?? Duration.zero,
                    duration: duration,
                    onDragStart: _onDragStart,
                    onDragUpdate: _onDragUpdate,
                    onDragEnd: _onDragEnd,
                  ),
                ),
              ),
              _Timestamp(value: duration),
            ],
          );
        },
      );
    },
  );

  void _onDragStart(Duration position) {
    widget.onInteraction();
    setState(() => _dragPosition = position);
  }

  void _onDragUpdate(Duration position) {
    widget.onInteraction();
    setState(() => _dragPosition = position);
  }

  void _onDragEnd(Duration position) {
    widget.onInteraction();
    setState(() => _dragPosition = null);
    widget.onSeek(position);
  }
}

class _Timestamp extends StatelessWidget {
  const _Timestamp({required this.value});

  final Duration value;

  @override
  Widget build(BuildContext context) => Text(
    $formatDuration(value),
    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: PlayerTheme.of(context).foreground),
  );
}

class _Track extends StatelessWidget {
  const _Track({
    required this.position,
    required this.buffer,
    required this.duration,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
  });

  final Duration position;
  final Duration buffer;
  final Duration duration;
  final ValueChanged<Duration> onDragStart;
  final ValueChanged<Duration> onDragUpdate;
  final ValueChanged<Duration> onDragEnd;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);
    final total = duration.inMilliseconds;

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              minHeight: 4,
              value: total == 0 ? 0 : (buffer.inMilliseconds / total).clamp(0.0, 1.0),
              backgroundColor: theme.progressTrack,
              valueColor: AlwaysStoppedAnimation<Color>(theme.progressBuffer),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            activeTrackColor: theme.progress,
            inactiveTrackColor: Colors.transparent,
            thumbColor: theme.progress,
            overlayColor: theme.progress.withValues(alpha: .2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          ),
          child: Slider(
            value: total == 0 ? 0 : position.inMilliseconds.clamp(0, total).toDouble(),
            max: total == 0 ? 1 : total.toDouble(),
            onChanged: total == 0 ? null : (value) => onDragUpdate(_at(value)),
            onChangeStart: (value) => onDragStart(_at(value)),
            onChangeEnd: (value) => onDragEnd(_at(value)),
          ),
        ),
      ],
    );
  }

  Duration _at(double value) => Duration(milliseconds: value.round());
}
