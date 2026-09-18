import 'package:flutter/material.dart';
import 'package:movier/common/navigator/app_navigator.dart';

/// Development entry point into the player until the details screen provides a
/// `contentUuid` of its own.
class TestPlayerScreen extends StatefulWidget {
  const TestPlayerScreen({super.key});

  @override
  State<TestPlayerScreen> createState() => _TestPlayerScreenState();
}

class _TestPlayerScreenState extends State<TestPlayerScreen> {
  static const String _defaultUuid = 'b38c531842b0f43e61dd5e46e74bf02ca03074fb60761e8ac77d70ad90f8e90d';

  final TextEditingController _uuidController = TextEditingController(text: _defaultUuid);

  /* #region Lifecycle */
  @override
  void dispose() {
    _uuidController.dispose();
    super.dispose();
  }
  /* #endregion */

  void _open() {
    final uuid = _uuidController.text.trim();
    if (uuid.isEmpty) return;

    // Root navigator: the player must cover the bottom navigation shell.
    AppNavigator.pushRoot(context, PlayerRoute(uuid));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('HLS Test Player')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          TextField(
            controller: _uuidController,
            decoration: const InputDecoration(labelText: 'contentUuid'),
          ),
          FilledButton(onPressed: _open, child: const Text('Смотреть')),
        ],
      ),
    ),
  );
}
