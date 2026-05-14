import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/widget/remote_image.dart';
import 'package:movier/common/widget/sizeble_press_interactive.dart';
import 'package:movier/feature/search/controller/movie_search_controller.dart';
import 'package:movier/feature/search/model/movie_preview.dart';
import 'package:movier/feature/search/model/search_data.dart';
import 'package:movier/feature/search/widget/search_field.dart';
import 'package:movier/feature/search/widget/search_scope.dart';

/// {@template search_screen}
/// SearchScreen widget.
/// {@endtemplate}
class FilterScreen extends StatefulWidget {
  /// {@macro search_screen}
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SearchScope(
    child: Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _SearchControl()),
            _MovieList(),
          ],
        ),
      ),
    ),
  );
}

class _SearchControl extends StatefulWidget {
  const _SearchControl({super.key});

  @override
  State<_SearchControl> createState() => _SearchControlState();
}

class _SearchControlState extends State<_SearchControl> {
  late final MovieSearchController movieSearchController;

  late final TextEditingController fieldSearchController;
  late final FocusNode searchFocus;

  @override
  void initState() {
    super.initState();

    movieSearchController = context.scops.search.movieSearchController;
    fieldSearchController = TextEditingController()..addListener(searchFieldListener);
    searchFocus = FocusNode();
  }

  @override
  void dispose() {
    fieldSearchController.dispose();
    searchFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: SearchField(textController: fieldSearchController, focusNode: searchFocus),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2),
          child: SizeblePressInteractive(
            child: SizedBox.square(
              dimension: 50,
              child: IconButton.filled(onPressed: () {}, icon: Icon(Icons.filter_list_rounded)),
            ),
          ),
        ),
      ],
    ),
  );

  void searchFieldListener() {
    movieSearchController.search(fieldSearchController.text);
  }
}

class _MovieList extends StatefulWidget {
  const _MovieList({super.key});

  @override
  State<_MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<_MovieList> {
  late final MovieSearchController movieSearchController;

  @override
  void initState() {
    movieSearchController = context.scops.search.movieSearchController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: movieSearchController,
      builder: (context, _) => switch (movieSearchController.state.data) {
        SearchData(:final results) when results.isNotEmpty => SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) => _MoviePreview(movie: results[index]),
            itemCount: results.length,
          ),
        ),
        _ => SliverToBoxAdapter(),
      },
    );
  }
}

class _MoviePreview extends StatelessWidget {
  const _MoviePreview({super.key, required this.movie});
  final MoviePreview movie;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: RemoteImage(movie.posterPath, fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              Text(
                movie.title,
                style: context.thm.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
