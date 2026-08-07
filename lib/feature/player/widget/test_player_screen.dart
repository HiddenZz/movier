import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:movier/common/env/env.dart';
import 'package:video_player/video_player.dart';

class TestPlayerScreen extends StatefulWidget {
  const TestPlayerScreen({super.key});

  @override
  State<TestPlayerScreen> createState() => _TestPlayerScreenState();
}

class _TestPlayerScreenState extends State<TestPlayerScreen> {
  static final String _baseUrl = Env.baseUrl;
  static const String _defaultUuid = 'b38c531842b0f43e61dd5e46e74bf02ca03074fb60761e8ac77d70ad90f8e90d';

  final _uuidController = TextEditingController(text: _defaultUuid);

  VideoPlayerController? _controller;
  bool _loading = false;
  String? _error;

  Future<void> _load() async {
    final uuid = _uuidController.text.trim();
    if (uuid.isEmpty) return;
    final url = '${_baseUrl}stream/$uuid/master.m3u8';

    await _controller?.dispose();
    setState(() {
      _loading = true;
      _error = null;
      _controller = null;
    });

    // Pre-flight: verify manifest is reachable and valid before passing to ExoPlayer.
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          validateStatus: (_) => true, // don't throw on 4xx/5xx
        ),
      );
      final response = await dio.get<String>(url, options: Options(responseType: ResponseType.plain));
      l.d('Pre-flight $url → HTTP ${response.statusCode}');
      l.d('Body preview: ${response.data?.substring(0, (response.data?.length ?? 0).clamp(0, 300))}');
      if ((response.statusCode ?? 0) != 200) {
        setState(() {
          _loading = false;
          _error = 'HTTP ${response.statusCode} от сервера.\nURL: $url\nТело: ${response.data}';
        });
        return;
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Сервер недоступен (${e.runtimeType}): $e\nURL: $url';
      });
      l.e('Pre-flight failed: $e');
      return;
    }

    final c = VideoPlayerController.networkUrl(Uri.parse(url));
    try {
      await c.initialize();
      c.addListener(() => setState(() {}));
      setState(() {
        _controller = c;
        _loading = false;
      });
      await c.play();
    } catch (e) {
      await c.dispose();
      setState(() {
        _loading = false;
        _error = 'ExoPlayer ошибка: $e';
      });
      l.e('VideoPlayer init failed: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _uuidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _controller;
    return Scaffold(
      appBar: AppBar(title: const Text('HLS Test Player')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _uuidController,
              decoration: const InputDecoration(labelText: 'contentUuid'),
            ),
            const SizedBox(height: 8),
            FilledButton(onPressed: _loading ? null : _load, child: const Text('Загрузить')),
            const SizedBox(height: 16),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            if (c != null && c.value.isInitialized) ...[
              AspectRatio(aspectRatio: c.value.aspectRatio, child: VideoPlayer(c)),
              VideoProgressIndicator(c, allowScrubbing: true),
              Center(
                child: IconButton(
                  iconSize: 48,
                  icon: Icon(c.value.isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () => c.value.isPlaying ? c.pause() : c.play(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
