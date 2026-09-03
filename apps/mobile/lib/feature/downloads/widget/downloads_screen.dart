import 'package:flutter/material.dart';

/// {@template downloads_screen}
/// DownloadsScreen widget.
/// {@endtemplate}
class DownloadsScreen extends StatefulWidget {
  /// {@macro downloads_screen}
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Загрузки')),
    body: const Center(child: Text('Загрузки')),
  );
}
