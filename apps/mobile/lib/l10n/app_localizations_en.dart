// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get playerQuality => 'Quality';

  @override
  String get playerQualityAuto => 'Auto';

  @override
  String get playerSpeed => 'Speed';

  @override
  String playerSpeedValue(String rate) {
    return '$rate×';
  }

  @override
  String get playerRetry => 'Retry';

  @override
  String get errorConnection => 'No connection to the server.';

  @override
  String get errorTimeout => 'The server took too long to respond.';

  @override
  String get errorNotFound => 'The content was not found.';

  @override
  String errorServer(int status) {
    return 'Server error ($status).';
  }

  @override
  String get errorBadResponse => 'The server returned an unexpected response.';

  @override
  String get errorMalformedPlaylist => 'The stream manifest is malformed.';

  @override
  String get errorPlayback => 'Playback failed.';

  @override
  String get errorUnknown => 'Something went wrong.';
}
