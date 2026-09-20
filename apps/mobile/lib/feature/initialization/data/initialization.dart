import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l/l.dart';
import 'package:movier/common/env/platform_capabilities.dart';
import 'package:movier/common/model/dependencies.dart';
import 'package:movier/feature/initialization/data/initialize_dependencies.dart';

Future<Dependencies> $initializeApp({
  void Function(int progress, String message)? onProgress,
  Future<void> Function(Dependencies dependencies)? onSuccess,
  void Function(Object error, StackTrace stackTrace)? onError,
}) async {
  late final WidgetsBinding binding;
  final stopwatch = Stopwatch()..start();
  try {
    binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

    if (PlatformCapabilities.current().supportsOrientationLock) {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    await _catchExceptions();
    final dependencies = await $initializeDependencies(onProgress).timeout(const Duration(minutes: 3));
    await onSuccess?.call(dependencies);
    return dependencies;
  } on Object catch (error, stackTrace) {
    onError?.call(error, stackTrace);

    rethrow;
  } finally {
    stopwatch.stop();
    binding.addPostFrameCallback((_) {
      binding.allowFirstFrame();
    });
  }
}

Future<void> _catchExceptions() async {
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    l.e(error, stackTrace, <String, String>{'tag': 'PlatformDispatcher'});
    return true;
  };

  final sourceFlutterError = FlutterError.onError;
  FlutterError.onError = (final details) {
    l.e(details.exception, details.stack, <String, String>{'tag': 'FlutterError'});
    sourceFlutterError?.call(details);
  };
}
