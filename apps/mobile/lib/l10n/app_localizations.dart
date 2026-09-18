import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru')];

  /// Title of the video quality selection menu
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get playerQuality;

  /// Adaptive quality option, plays the HLS master playlist
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get playerQualityAuto;

  /// Title of the playback speed selection menu
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get playerSpeed;

  /// Playback speed menu entry, e.g. 1.5×
  ///
  /// In en, this message translates to:
  /// **'{rate}×'**
  String playerSpeedValue(String rate);

  /// Button that reloads the stream after a failure
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get playerRetry;

  /// Shown when the host is unreachable
  ///
  /// In en, this message translates to:
  /// **'No connection to the server.'**
  String get errorConnection;

  /// Shown on connect, send or receive timeout
  ///
  /// In en, this message translates to:
  /// **'The server took too long to respond.'**
  String get errorTimeout;

  /// Shown on HTTP 404 for a contentUuid
  ///
  /// In en, this message translates to:
  /// **'The content was not found.'**
  String get errorNotFound;

  /// Shown on HTTP 5xx
  ///
  /// In en, this message translates to:
  /// **'Server error ({status}).'**
  String errorServer(int status);

  /// Shown on an unhandled non-2xx status or an unparseable body
  ///
  /// In en, this message translates to:
  /// **'The server returned an unexpected response.'**
  String get errorBadResponse;

  /// Shown when master.m3u8 cannot be parsed
  ///
  /// In en, this message translates to:
  /// **'The stream manifest is malformed.'**
  String get errorMalformedPlaylist;

  /// Shown for an error reported by the player itself
  ///
  /// In en, this message translates to:
  /// **'Playback failed.'**
  String get errorPlayback;

  /// Fallback for an unrecognised error type
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get errorUnknown;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
