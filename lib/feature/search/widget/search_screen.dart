import 'package:flutter/material.dart';

/// {@template search_screen}
/// SearchScreen widget.
/// {@endtemplate}
class SearchScreen extends StatefulWidget {
  /// {@macro search_screen}
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: CustomScrollView(slivers: [SliverToBoxAdapter(child: _SearchControl())]),
    ),
  );
}

class _SearchControl extends StatefulWidget {
  const _SearchControl({super.key});

  @override
  State<_SearchControl> createState() => _SearchControlState();
}

class _SearchControlState extends State<_SearchControl> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: SizedBox(height: 60, child: TextField())),
        SizedBox.square(
          dimension: 50,
          child: IconButton.filled(onPressed: () {}, icon: Icon(Icons.filter_list_rounded)),
        ),
      ],
    ),
  );
}
