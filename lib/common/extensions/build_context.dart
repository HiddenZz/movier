import 'package:flutter/material.dart';
import 'package:movier/common/model/dependencies.dart';
import 'package:movier/common/theme/smooth_border_theme.dart';
import 'package:movier/feature/initialization/widget/dependencies_scope.dart';
import 'package:movier/feature/search/widget/search_scope.dart';

extension type _Themes._(BuildContext _context) {
  ThemeData get theme => Theme.of(_context);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  SmoothBorderTheme? get smoothBorder => theme.extension<SmoothBorderTheme>();
}

extension type _Sizer._(BuildContext _context) {
  Size get size => MediaQuery.sizeOf(_context);
}

extension type _Dependencies._(BuildContext _c) {
  Dependencies get deps => DependenciesScope.of(_c, listen: false);
  Dependencies get depsOf => DependenciesScope.of(_c);

  SearchDependecies get search => SearchDependeciesScope.of(_c, listen: false);
  SearchDependecies get searchOf => SearchDependeciesScope.of(_c);
}

extension BuildContextExt on BuildContext {
  _Themes get thm => _Themes._(this);

  _Sizer get mediaQuery => _Sizer._(this);

  _Dependencies get scops => _Dependencies._(this);
}
