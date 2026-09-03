import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/search/model/movie_preview.dart';

part 'search_data.freezed.dart';
part 'search_data.g.dart';

/// SearchData data class
@freezed
abstract class SearchData with _$SearchData {
  const factory SearchData({
    required int page,
    required List<MoviePreview> results,
    required int totalPages,
    @Default(0) int totalResults,
  }) = _SearchData;

  const SearchData._();

  /// Generate SearchData class from Map<String, Object?>
  factory SearchData.fromJson(Map<String, Object?> json) => _$SearchDataFromJson(json);
}
