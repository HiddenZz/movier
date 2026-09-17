import 'dart:async';

import 'package:control/control.dart';
import 'package:dio/dio.dart';
import 'package:l/l.dart';
import 'package:media_kit/media_kit.dart';
import 'package:movier/common/env/env.dart';
import 'package:movier/common/model/dependencies.dart';
import 'package:movier/common/observers/controller_observer.dart';

final class _MutableDependencies implements Dependencies {
  @override
  late Dio dio;
}

Future<Dependencies> $initializeDependencies(void Function(int progress, String message)? onProgress) async {
  final dependencies = _MutableDependencies();
  final totalSteps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    try {
      currentStep++;
      final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
      onProgress?.call(percent, step.key);
      l.i('Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"');
      await step.value(dependencies);
    } on Object catch (error, stackTrace) {
      l.e('Initialization failed at step "${step.key}": $error', stackTrace);
      Error.throwWithStackTrace('Initialization failed at step "${step.key}": $error', stackTrace);
    }
  }
  return dependencies;
}

typedef _InitializationStep = FutureOr<void> Function(_MutableDependencies dependencies);

final Map<String, _InitializationStep> _initializationSteps = <String, _InitializationStep>{
  "http client init": (deps) {
    final options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
    );

    deps.dio = Dio(options);
  },
  "Controller Observer": (_) {
    Controller.observer = DefaultControllerObserver(logger: l);
  },
  "media kit init": (_) {
    MediaKit.ensureInitialized();
  },
};
