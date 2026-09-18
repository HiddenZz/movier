import 'package:flutter/material.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/feature/player/widget/player.dart';
import 'package:movier/feature/player/widget/player_scope.dart';

/// {@template player_screen}
/// PlayerScreen widget.
///
/// Pushed onto the root navigator, so it covers the navigation shell and
/// fullscreen stays a layout change rather than another route.
/// {@endtemplate}
class PlayerScreen extends StatelessWidget {
  /// {@macro player_screen}
  const PlayerScreen({required this.contentUuid, super.key, this.title});

  final String contentUuid;
  final String? title;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: PlayerTheme.of(context).background,
    body: PlayerScope(
      child: PlayerView(contentUuid: contentUuid, title: title),
    ),
  );
}
