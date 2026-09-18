import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movier/l10n/app_localizations.dart';

/// Maps an arbitrary error object to a message that can be shown to the user.
///
/// Business logic never formats user-facing text itself: controllers keep the
/// raw error in their `failure` state and the widget layer resolves it here.
abstract final class ErrorUtil {
  /// Resolves [error] to a localized, human readable message.
  static String errorToString(Object error, AppLocalizations l10n) => switch (error) {
    DioException(type: DioExceptionType.connectionTimeout) ||
    DioException(type: DioExceptionType.sendTimeout) ||
    DioException(type: DioExceptionType.receiveTimeout) => l10n.errorTimeout,
    DioException(type: DioExceptionType.connectionError) => l10n.errorConnection,
    DioException(type: DioExceptionType.badResponse, response: final response?) => _statusToString(
      response.statusCode,
      l10n,
    ),
    DioException(error: final SocketException _) => l10n.errorConnection,
    DioException() => l10n.errorBadResponse,
    FormatException() => l10n.errorMalformedPlaylist,
    SocketException() => l10n.errorConnection,
    // [Player.stream.error] emits raw mpv log lines as plain strings.
    String() => l10n.errorPlayback,
    _ => l10n.errorUnknown,
  };

  static String _statusToString(int? status, AppLocalizations l10n) => switch (status) {
    HttpStatus.notFound => l10n.errorNotFound,
    final int code when code >= 500 => l10n.errorServer(code),
    _ => l10n.errorBadResponse,
  };
}
