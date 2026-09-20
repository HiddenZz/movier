import 'package:flutter/services.dart';

/// Hides the system bars and pins the device to landscape.
Future<void> $enterPlayerFullscreen() => Future.wait(<Future<void>>[
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: const <SystemUiOverlay>[]),
  SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]),
]);

/// Restores the system bars and the app-wide portrait lock.
///
Future<void> $exitPlayerFullscreen() => Future.wait(<Future<void>>[
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values),
  SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]),
]);
