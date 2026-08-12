import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final Player player;

  @override
  void initState() {
    super.initState();

    player = Player();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
