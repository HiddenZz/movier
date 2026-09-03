import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';
import 'package:movier/common/widget/remote_image.dart';
import 'package:movier/common/widget/smooth_border.dart';
import 'package:movier/feature/search/model/movie_preview.dart';

class SearchDropdownContainer extends StatefulWidget {
  const SearchDropdownContainer({super.key, required this.movies, required this.size});
  final List<MoviePreview> movies;
  final Size size;

  @override
  State<SearchDropdownContainer> createState() => _SearchDropdownContainerState();
}

class _SearchDropdownContainerState extends State<SearchDropdownContainer> {
  @override
  Widget build(BuildContext context) => SmoothBorder(
    child: Material(
      type: MaterialType.transparency,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: widget.size.height,
          maxWidth: widget.size.width,
          minWidth: widget.size.width,
          minHeight: 60,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Scrollbar(
                  child: ListView(
                    padding: EdgeInsets.only(),
                    children: [
                      ...List.generate(widget.movies.length, (index) => _MoviePreview(movie: widget.movies[index])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _MoviePreview extends StatelessWidget {
  const _MoviePreview({super.key, required this.movie});
  final MoviePreview movie;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        spacing: 16,
        children: [
          Flexible(child: RemoteImage(movie.posterPath)),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                Text(movie.title, style: context.thm.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
