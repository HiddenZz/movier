import 'package:flutter/widgets.dart';
import 'package:movier/common/model/dependencies.dart';

/// {@template dependencies_scope}
/// DependenciesScope widget.
/// {@endtemplate}
class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies_scope}
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key, // ignore: unused_element_parameter
  });

  final Dependencies dependencies;

  @override
  bool updateShouldNotify(covariant DependenciesScope oldWidget) => !identical(dependencies, oldWidget.dependencies);

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `DependenciesScope.maybeOf(context)`.
  static Dependencies? maybeOf(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<DependenciesScope>()?.dependencies
      : context.getInheritedWidgetOfExactType<DependenciesScope>()?.dependencies;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
    'Out of scope, not found inherited widget '
        'a DependenciesScope of the exact type',
    'out_of_scope',
  );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `DependenciesScope.of(context)`
  static Dependencies of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();
}
