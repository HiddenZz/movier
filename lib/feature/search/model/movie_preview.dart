import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_preview.freezed.dart';
part 'movie_preview.g.dart';

/// MoviePreview data class
@freezed
abstract class MoviePreview with _$MoviePreview {
  const factory MoviePreview({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required String originalTitle,
    @Default(.0) double popularity,
  }) = _MoviePreview;

  const MoviePreview._();

  /// Generate MoviePreview class from Map<String, Object?>
  factory MoviePreview.fromJson(Map<String, Object?> json) => _$MoviePreviewFromJson(json);
}
