import 'package:flutter/material.dart';
import 'package:movier/feature/downloads/widget/downloads_screen.dart';
import 'package:movier/feature/home/widget/home_screen.dart';
import 'package:movier/feature/search/widget/filters_screen.dart';

@immutable
sealed class AppPage extends MaterialPage<void> {
  const AppPage({
    required String super.name,
    required Map<String, Object?>? super.arguments,
    required super.child,
    required LocalKey super.key,
  });

  @override
  String get name => super.name ?? 'Unknown';

  @override
  Map<String, Object?> get arguments => switch (super.arguments) {
    Map<String, Object?> args when args.isNotEmpty => args,
    _ => const <String, Object?>{},
  };

  @override
  int get hashCode => key.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppPage && key == other.key;
}

class HomeRoute extends AppPage {
  HomeRoute() : super(child: HomeScreen(), name: 'Home', arguments: <String, Object>{}, key: ValueKey<String>('Home'));
}

class SearchRoute extends AppPage {
  SearchRoute()
    : super(
        child: const FilterScreen(),
        name: 'Search',
        arguments: const <String, Object>{},
        key: const ValueKey<String>('Search'),
      );
}

class DownloadsRoute extends AppPage {
  DownloadsRoute()
    : super(
        child: const DownloadsScreen(),
        name: 'Downloads',
        arguments: const <String, Object>{},
        key: const ValueKey<String>('Downloads'),
      );
}
