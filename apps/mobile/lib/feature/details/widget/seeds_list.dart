import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/feature/details/model/seed.dart';
import 'package:movier/feature/details/controller/seeds_controller.dart';

class SeedsList extends StatefulWidget {
  const SeedsList({super.key, required this.id});

  final int id;

  @override
  State<SeedsList> createState() => _SeedsListState();
}

class _SeedsListState extends State<SeedsList> {
  late final SeedsController seedsController;

  @override
  void initState() {
    super.initState();

    seedsController = context.scops.details.seedsController;

    seedsController.fetchById(widget.id);
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: seedsController,
    builder: (context, _) => ListView.builder(
      itemBuilder: (context, index) => SeedTile(seed: seedsController.state.seeds[index]),
      itemCount: seedsController.state.seeds.length,
    ),
  );
}

class SeedTile extends StatelessWidget {
  const SeedTile({super.key, required this.seed});

  final Seed seed;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => context.scops.details.torrentController.downloadRequest(seed.guid, seed.tmdbId),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(spacing: 8, children: [Text(seed.title, style: context.thm.textTheme.labelMedium)]),
    ),
  );
}
