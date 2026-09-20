import 'package:flutter/material.dart';
import 'package:movier/common/model/dependencies.dart';
import 'package:movier/common/theme/smooth_border_theme.dart';
import 'package:movier/l10n/app_localizations.dart';
import 'package:movier/feature/details/widget/details_scope.dart';
import 'package:movier/feature/initialization/widget/dependencies_scope.dart';
import 'package:movier/feature/player/widget/player_scope.dart';
import 'package:movier/feature/search/widget/search_scope.dart';

extension type _Themes._(BuildContext _context) {
  ThemeData get theme => Theme.of(_context);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  SmoothBorderThemeData get smoothBorder => SmoothBorderTheme.of(_context);
}

extension type _Sizer._(BuildContext _context) {
  Size get size => MediaQuery.sizeOf(_context);
}

extension type _L10n._(BuildContext _context) {
  AppLocalizations get l10n => AppLocalizations.of(_context);
}

extension type _Dependencies._(BuildContext _c) {
  Dependencies get deps => DependenciesScope.of(_c, listen: false);
  Dependencies get depsOf => DependenciesScope.of(_c);

  SearchDependecies get search => SearchDependeciesScope.of(_c, listen: false);
  SearchDependecies get searchOf => SearchDependeciesScope.of(_c);

  DetailsDependecies get details => DetailsDependeciesScope.of(_c, listen: false);
  DetailsDependecies get detailsOf => DetailsDependeciesScope.of(_c, listen: true);

  PlayerDependecies get player => PlayerDependeciesScope.of(_c, listen: false);
  PlayerDependecies get playerOf => PlayerDependeciesScope.of(_c);
}

extension BuildContextExt on BuildContext {
  _Themes get thm => _Themes._(this);

  _Sizer get mediaQuery => _Sizer._(this);

  _Dependencies get scops => _Dependencies._(this);

  AppLocalizations get l10n => _L10n._(this).l10n;
}
