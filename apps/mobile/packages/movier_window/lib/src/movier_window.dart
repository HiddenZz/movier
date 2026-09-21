import 'package:flutter/foundation.dart';
import 'package:movier_window/src/messages.g.dart';

/// Talks to the native window through the generated Pigeon APIs.
///
/// One instance owns the [WindowFullscreenFlutterApi] handler slot, so only
/// one should be alive per engine at a time.
class MovierWindow implements WindowFullscreenFlutterApi {
  MovierWindow({required ValueChanged<bool> onFullscreenChanged})
    : _onFullscreenChanged = onFullscreenChanged,
      _host = WindowFullscreenHostApi() {
    WindowFullscreenFlutterApi.setUp(this);
  }

  final ValueChanged<bool> _onFullscreenChanged;
  final WindowFullscreenHostApi _host;

  /// The window's actual fullscreen state right now.
  Future<bool> isFullscreen() => _host.isFullscreen();

  /// Requests entering or leaving fullscreen. See
  /// [WindowFullscreenHostApi.setFullscreen] for what the returned bool means.
  Future<bool> setFullscreen({required bool fullscreen}) => _host.setFullscreen(fullscreen);

  @override
  void onFullscreenChanged(bool fullscreen) => _onFullscreenChanged(fullscreen);

  /// Releases the [WindowFullscreenFlutterApi] handler slot.
  void dispose() => WindowFullscreenFlutterApi.setUp(null);
}
