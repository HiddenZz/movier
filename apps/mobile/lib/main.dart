import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:movier/common/widget/app.dart';
import 'package:movier/feature/initialization/data/initialization.dart';
import 'package:movier/feature/initialization/widget/dependencies_scope.dart';

void main() => l.capture<void>(
  () => runZonedGuarded<void>(() async {
    $initializeApp(
      onProgress: _progress,
      onSuccess: (dependencies) async => runApp(DependenciesScope(dependencies: dependencies, child: App())),
      onError: l.e,
    ).ignore();
  }, l.e),
);

void _progress(int progress, String message) => l.i('[$progress] $message');
