import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movier/feature/details/widget/details_scope.dart';
import 'package:movier/feature/details/widget/seeds_list.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: DetailsScope(child: SeedsList(id: widget.id)),
  );
}
