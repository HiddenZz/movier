import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/details/model/genre.dart';

export 'package:movier/feature/details/model/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required final int id,
    required final String title,
    required final String originalTitle,
    required final String overview,
    final String? posterPath,
    final String? backdropPath,
    required final String releaseDate,
    required final double voteAverage,
    required final int voteCount,
    required final List<Genre> genres,
    required final int runtime,
    required final String status,
  }) = _MovieDetails;

  const MovieDetails._();

  factory MovieDetails.fromJson(Map<String, Object?> json) => _$MovieDetailsFromJson(json);
}
