import 'package:dio/dio.dart';
import 'package:l/l.dart';
import 'package:movier/common/model/dependencies.dart';

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

typedef _InitializationStep = Future<void> Function(Dependencies dependencies);

final Map<String, _InitializationStep> _initializationSteps = <String, _InitializationStep>{};
