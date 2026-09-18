import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movier/common/navigator/app_navigator.dart';
import 'package:movier/common/theme/theme_data_factory.dart';
import 'package:movier/l10n/app_localizations.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({
    super.key, // ignore: unused_element_parameter
  });

  @override
  State<App> createState() => _AppState();
}

/// State for widget App.
class _AppState extends State<App> {
  static GlobalKey<_AppState> key = GlobalKey<_AppState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
    key: key,
    theme: ThemeDataFactory.light(),
    localizationsDelegates: const <LocalizationsDelegate<Object?>>[
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: AppNavigator(pages: <AppPage>[HomeRoute()]),
  );
}
