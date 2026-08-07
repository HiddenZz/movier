import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/theme/smooth_border_theme.dart';
import 'package:movier/common/widget/remote_image.dart';
import 'package:movier/common/widget/smooth_border.dart';
import 'package:movier/feature/details/controller/movie_detail_controller.dart';
import 'package:movier/feature/details/widget/details_scope.dart';
import 'package:movier/feature/details/widget/seeds_list.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: DetailsScope(child: _Body(id: id)),
  );
}

class _Body extends StatefulWidget {
  const _Body({super.key, required this.id});

  final int id;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final MovieDetailController detailController;

  @override
  void initState() {
    super.initState();

    detailController = context.scops.details.movieDetailController;

    detailController.fetch(widget.id);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: ListenableBuilder(
      listenable: detailController,
      builder: (context, _) => switch (detailController.state) {
        Idle$MovieDetailState(:final movie?) => CustomScrollView(
          slivers: [
            ?switch (movie.posterUrl) {
              final url? => SliverToBoxAdapter(child: _Poster(url: url)),
              _ => null,
            },
          ],
        ),
        _ => CircularProgressIndicator(),
      },
    ),
  );
}

class _Poster extends StatelessWidget {
  const _Poster({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) => SmoothBorderTheme(
    data: context.thm.smoothBorder.copyWith(color: context.thm.colorScheme.surface, strokeWidth: 1, borderRadius: 24),
    child: SmoothBorder(
      child: AspectRatio(aspectRatio: 2 / 3, child: RemoteImage(url)),
    ),
  );
}
