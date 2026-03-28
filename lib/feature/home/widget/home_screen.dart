import 'package:flutter/material.dart';
import 'package:movier/common/navigator/app_navigator.dart';

/// {@template home_screen}
/// HomeScreen widget — shell with bottom navigation and nested navigators.
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  /// {@macro home_screen}
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  late final List<Widget> _tabs = [
    AppNavigator(pages: [SearchRoute()]),
    AppNavigator(pages: [DownloadsRoute()]),
  ];

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, index, _) => IndexedStack(index: index, children: _tabs),
    ),
    bottomNavigationBar: ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, index, _) => NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: index,
        onDestinationSelected: (i) => _currentIndex.value = i,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search), label: ''),
          NavigationDestination(icon: Icon(Icons.downloading_outlined), label: ''),
        ],
      ),
    ),
  );
}
