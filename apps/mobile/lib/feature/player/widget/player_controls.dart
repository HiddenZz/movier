import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/feature/player/widget/player_menus.dart';
import 'package:movier/feature/player/widget/player_seek_bar.dart';

/// {@template player_controls}
/// Overlay above the video: top bar, centre play button and bottom bar.
///
/// Each piece subscribes to the one player stream it needs, so a position tick
/// does not rebuild the whole overlay.
/// {@endtemplate}
class PlayerControls extends StatelessWidget {
  /// {@macro player_controls}
  const PlayerControls({
    required this.contentUuid,
    required this.player,
    required this.visible,
    required this.fullscreen,
    required this.scrubbing,
    required this.onInteraction,
    required this.onToggleFullscreen,
    required this.onClose,
    required this.onSeek,
    super.key,
    this.title,
    this.scrubPosition,
  });

  final String contentUuid;
  final String? title;
  final Player player;
  final bool visible;
  final bool fullscreen;
  final bool scrubbing;
  final Duration? scrubPosition;
  final VoidCallback onInteraction;
  final VoidCallback onToggleFullscreen;
  final VoidCallback onClose;
  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: Durations.short4,
        curve: Curves.easeInOut,
        child: Stack(
          fit: StackFit.expand,
          children: [
            IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[theme.scrim, Colors.transparent, theme.scrim],
                    stops: const <double>[0, .5, 1],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  _TopBar(title: title, onClose: onClose),
                  Expanded(
                    child: _PlayButton(player: player, onInteraction: onInteraction),
                  ),
                  _BottomBar(
                    contentUuid: contentUuid,
                    player: player,
                    fullscreen: fullscreen,
                    scrubbing: scrubbing,
                    scrubPosition: scrubPosition,
                    onInteraction: onInteraction,
                    onToggleFullscreen: onToggleFullscreen,
                    onSeek: onSeek,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title, required this.onClose});

  final String? title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Row(
      spacing: 8,
      children: [
        IconButton(
          onPressed: onClose,
          icon: Icon(Icons.arrow_back, color: theme.foreground),
        ),
        ?switch (title) {
          final String title => Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.thm.textTheme.titleMedium?.copyWith(color: theme.foreground),
            ),
          ),
          _ => null,
        },
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.player, required this.onInteraction});

  final Player player;
  final VoidCallback onInteraction;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Center(
      child: StreamBuilder<bool>(
        initialData: player.state.buffering,
        stream: player.stream.buffering,
        builder: (context, bufferingSnapshot) => switch (bufferingSnapshot.data) {
          true => CircularProgressIndicator(color: theme.foreground),
          _ => StreamBuilder<bool>(
            initialData: player.state.playing,
            stream: player.stream.playing,
            builder: (context, playingSnapshot) => IconButton(
              iconSize: 56,
              onPressed: () {
                onInteraction();
                player.playOrPause();
              },
              icon: Icon(
                (playingSnapshot.data ?? false) ? Icons.pause_circle_filled : Icons.play_circle_filled,
                color: theme.foreground,
              ),
            ),
          ),
        },
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.contentUuid,
    required this.player,
    required this.fullscreen,
    required this.scrubbing,
    required this.scrubPosition,
    required this.onInteraction,
    required this.onToggleFullscreen,
    required this.onSeek,
  });

  final String contentUuid;
  final Player player;
  final bool fullscreen;
  final bool scrubbing;
  final Duration? scrubPosition;
  final VoidCallback onInteraction;
  final VoidCallback onToggleFullscreen;
  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final theme = PlayerTheme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: PlayerSeekBar(
            player: player,
            scrubPosition: scrubPosition,
            onSeek: (position) {
              onInteraction();
              onSeek(position);
            },
          ),
        ),
        Row(
          children: [
            const Spacer(),
            // Re-opening the demuxer mid-drag would fight the scrub.
            PlayerQualityButton(contentUuid: contentUuid, enabled: !scrubbing),
            const PlayerRateButton(),
            IconButton(
              onPressed: () {
                onInteraction();
                onToggleFullscreen();
              },
              icon: Icon(fullscreen ? Icons.fullscreen_exit : Icons.fullscreen, color: theme.foreground),
            ),
          ],
        ),
      ],
    );
  }
}
