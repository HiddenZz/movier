// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get playerQuality => 'Качество';

  @override
  String get playerQualityAuto => 'Авто';

  @override
  String get playerSpeed => 'Скорость';

  @override
  String playerSpeedValue(String rate) {
    return '$rate×';
  }

  @override
  String get playerRetry => 'Повторить';

  @override
  String get errorConnection => 'Нет соединения с сервером.';

  @override
  String get errorTimeout => 'Сервер слишком долго не отвечает.';

  @override
  String get errorNotFound => 'Контент не найден.';

  @override
  String errorServer(int status) {
    return 'Ошибка сервера ($status).';
  }

  @override
  String get errorBadResponse => 'Сервер вернул неожиданный ответ.';

  @override
  String get errorMalformedPlaylist => 'Манифест потока повреждён.';

  @override
  String get errorPlayback => 'Не удалось воспроизвести.';

  @override
  String get errorUnknown => 'Что-то пошло не так.';
}
