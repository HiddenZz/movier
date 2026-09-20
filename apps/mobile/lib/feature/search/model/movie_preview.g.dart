// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoviePreview _$MoviePreviewFromJson(Map<String, dynamic> json) => _MoviePreview(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  posterPath: json['posterPath'] as String,
  originalTitle: json['originalTitle'] as String,
  popularity: (json['popularity'] as num?)?.toDouble() ?? .0,
);

Map<String, dynamic> _$MoviePreviewToJson(_MoviePreview instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'originalTitle': instance.originalTitle,
  'popularity': instance.popularity,
};
