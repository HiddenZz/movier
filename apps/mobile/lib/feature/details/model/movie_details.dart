import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/details/model/genre.dart';

export 'package:movier/feature/details/model/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required int tmdbId,
    required String title,
    required String overview,
    required String? posterUrl,
    required String? backdropPath,
    required String releaseDate,
    required double? voteAverage,
    required int? voteCount,
    // required final List<Genre> genres,
    required int? runtime,
  }) = _MovieDetails;

  const MovieDetails._();

  factory MovieDetails.fromJson(Map<String, Object?> json) => _$MovieDetailsFromJson(json);
}
