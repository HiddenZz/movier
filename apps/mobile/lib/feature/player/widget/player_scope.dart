import 'package:flutter/widgets.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/feature/player/controller/media_controller.dart';
import 'package:movier/feature/player/data/hls_repository.dart';

/// {@template player_scope}
/// PlayerScope widget.
/// {@endtemplate}
class PlayerScope extends StatefulWidget {
  /// {@macro player_scope}
  const PlayerScope({
    required this.child,
    super.key, // ignore: unused_element_parameter
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<PlayerScope> createState() => _PlayerScopeState();
}

/// State for widget PlayerScope.
class _PlayerScopeState extends State<PlayerScope> {
  late final MediaController mediaController;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();

    mediaController = MediaController(repository: HlsRepositoryImpl(dio: context.scops.deps.dio));
  }

  @override
  void dispose() {
    mediaController.dispose();

    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) =>
      PlayerDependeciesScope(deps: (mediaController: mediaController), child: widget.child);
}

typedef PlayerDependecies = ({MediaController mediaController});

/// {@template player_scope}
/// _PlayerDepsInherited widget.
/// {@endtemplate}
class PlayerDependeciesScope extends InheritedWidget {
  /// {@macro player_scope}
  const PlayerDependeciesScope({
    required super.child,
    required this.deps,
    super.key, // ignore: unused_element_parameter
  });

  final PlayerDependecies deps;

  @override
  bool updateShouldNotify(covariant PlayerDependeciesScope oldWidget) => deps != oldWidget.deps;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `_PlayerDepsInherited.maybeOf(context)`.
  static PlayerDependecies? maybeOf(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<PlayerDependeciesScope>()?.deps
      : context.getInheritedWidgetOfExactType<PlayerDependeciesScope>()?.deps;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
    'Out of scope, not found inherited widget '
        'a _PlayerDepsInherited of the exact type',
    'out_of_scope',
  );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `_PlayerDepsInherited.of(context)`
  static PlayerDependecies of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();
}
