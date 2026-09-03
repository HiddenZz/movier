import 'package:flutter/widgets.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/feature/details/controller/movie_detail_controller.dart';
import 'package:movier/feature/details/controller/seeds_controller.dart';
import 'package:movier/feature/details/controller/torrent_controller.dart';
import 'package:movier/feature/details/data/movie_repository.dart';
import 'package:movier/feature/details/data/seeds_repository.dart';
import 'package:movier/feature/details/data/torrent_repository.dart';

/// {@template details_scope}
/// DetailsScope widget.
/// {@endtemplate}
class DetailsScope extends StatefulWidget {
  /// {@macro details_scope}
  const DetailsScope({
    required this.child,
    super.key, // ignore: unused_element_parameter
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<DetailsScope> createState() => _DetailsScopeState();
}

/// State for widget DetailsScope.
class _DetailsScopeState extends State<DetailsScope> {
  late final SeedsController seedsController;
  late final TorrentController torrentController;
  late final MovieDetailController movieDetailController;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    seedsController = SeedsController(repository: SeedsRepositoryImpl(dio: context.scops.deps.dio));
    torrentController = TorrentController(repository: TorrentRepositoryImpl(dio: context.scops.deps.dio));
    movieDetailController = MovieDetailController(movieRepository: MovieRepositoryImpl(dio: context.scops.deps.dio));
  }

  @override
  void dispose() {
    seedsController.dispose();
    torrentController.dispose();
    movieDetailController.dispose();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => DetailsDependeciesScope(
    deps: (
      seedsController: seedsController,
      torrentController: torrentController,
      movieDetailController: movieDetailController,
    ),
    child: widget.child,
  );
}

typedef DetailsDependecies = ({
  SeedsController seedsController,
  TorrentController torrentController,
  MovieDetailController movieDetailController,
});

/// {@template details_scope}
/// _DetailsDepsInherited widget.
/// {@endtemplate}
class DetailsDependeciesScope extends InheritedWidget {
  /// {@macro details_scope}
  const DetailsDependeciesScope({
    required super.child,
    required this.deps,
    super.key, // ignore: unused_element_parameter
  });

  final DetailsDependecies deps;

  @override
  bool updateShouldNotify(covariant DetailsDependeciesScope oldWidget) => deps != oldWidget.deps;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `_DetailsDepsInherited.maybeOf(context)`.
  static DetailsDependecies? maybeOf(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<DetailsDependeciesScope>()?.deps
      : context.getInheritedWidgetOfExactType<DetailsDependeciesScope>()?.deps;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
    'Out of scope, not found inherited widget '
        'a _DetailsDepsInherited of the exact type',
    'out_of_scope',
  );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `_DetailsDepsInherited.of(context)`
  static DetailsDependecies of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();
}
