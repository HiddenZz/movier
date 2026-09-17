import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/feature/player/controller/media_controller.dart';
import 'package:movier/feature/player/model/hls_variant.dart';

/// Quality picker.
///
/// Hidden when the master playlist carries fewer than two renditions
class PlayerQualityButton extends StatelessWidget {
  const PlayerQualityButton({required this.contentUuid, required this.state, required this.enabled, super.key});

  final String contentUuid;
  final MediaState state;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!state.hasQualityChoice) return const SizedBox.shrink();

    final theme = PlayerTheme.of(context);
    final controller = context.scops.player.mediaController;

    return PopupMenuButton<HlsVariant?>(
      enabled: enabled,
      tooltip: context.l10n.playerQuality,
      initialValue: state.selected,
      onSelected: (variant) => controller.selectQuality(contentUuid, variant),
      itemBuilder: (context) => <PopupMenuEntry<HlsVariant?>>[
        PopupMenuItem<HlsVariant?>(value: null, child: Text(context.l10n.playerQualityAuto)),
        for (final variant in state.variants) PopupMenuItem<HlsVariant?>(value: variant, child: Text(variant.label)),
      ],
      child: _Label(
        text: state.selected?.label ?? context.l10n.playerQualityAuto,
        icon: Icons.high_quality_outlined,
        color: enabled ? theme.foreground : theme.foregroundMuted,
      ),
    );
  }
}

/// Playback speed picker.
class PlayerRateButton extends StatelessWidget {
  const PlayerRateButton({required this.state, super.key});

  final MediaState state;

  @override
  Widget build(BuildContext context) {
    final controller = context.scops.player.mediaController;

    return PopupMenuButton<double>(
      tooltip: context.l10n.playerSpeed,
      initialValue: state.rate,
      onSelected: controller.setRate,
      itemBuilder: (context) => <PopupMenuEntry<double>>[
        for (final rate in kPlaybackRates)
          PopupMenuItem<double>(value: rate, child: Text(context.l10n.playerSpeedValue($formatRate(rate)))),
      ],
      child: _Label(
        text: context.l10n.playerSpeedValue($formatRate(state.rate)),
        icon: Icons.speed_outlined,
        color: PlayerTheme.of(context).foreground,
      ),
    );
  }
}

/// Trims a trailing `.0` so 1.0 reads as `1×` but 1.5 stays `1.5×`.
String $formatRate(double rate) => rate == rate.roundToDouble() ? rate.toStringAsFixed(0) : rate.toString();

class _Label extends StatelessWidget {
  const _Label({required this.text, required this.icon, required this.color});

  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(icon, size: 18, color: color),
        Text(text, style: context.thm.textTheme.labelMedium?.copyWith(color: color)),
      ],
    ),
  );
}
