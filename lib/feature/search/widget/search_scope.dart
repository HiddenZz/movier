import 'package:flutter/widgets.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/feature/search/controller/movie_search_controller.dart';
import 'package:movier/feature/search/data/search_repository.dart';

/// {@template search_scope}
/// SearchScope widget.
/// {@endtemplate}
class SearchScope extends StatefulWidget {
  /// {@macro search_scope}
  const SearchScope({
    required this.child,
    super.key, // ignore: unused_element_parameter
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<SearchScope> createState() => _SearchScopeState();
}

/// State for widget SearchScope.
class _SearchScopeState extends State<SearchScope> {
  late final MovieSearchController movieSearchController;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    movieSearchController = MovieSearchController(repository: SearchRepositoryImpl(dio: context.scops.deps.dio));
  }

  @override
  void dispose() {
    movieSearchController.dispose();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) =>
      SearchDependeciesScope(deps: (movieSearchController: movieSearchController), child: widget.child);
}

typedef SearchDependecies = ({MovieSearchController movieSearchController});

/// {@template search_scope}
/// _SearchDepsInherited widget.
/// {@endtemplate}
class SearchDependeciesScope extends InheritedWidget {
  /// {@macro search_scope}
  const SearchDependeciesScope({
    required super.child,
    required this.deps,
    super.key, // ignore: unused_element_parameter
  });

  final SearchDependecies deps;

  @override
  bool updateShouldNotify(covariant SearchDependeciesScope oldWidget) => deps != oldWidget.deps;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `_SearchDepsInherited.maybeOf(context)`.
  static SearchDependecies? maybeOf(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<SearchDependeciesScope>()?.deps
      : context.getInheritedWidgetOfExactType<SearchDependeciesScope>()?.deps;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
    'Out of scope, not found inherited widget '
        'a _SearchDepsInherited of the exact type',
    'out_of_scope',
  );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `_SearchDepsInherited.of(context)`
  static SearchDependecies of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();
}
