// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) =>
    _MovieDetails(
      tmdbId: (json['tmdbId'] as num).toInt(),
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterUrl: json['posterUrl'] as String?,
      backdropPath: json['backdropPath'] as String?,
      releaseDate: json['releaseDate'] as String,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailsToJson(_MovieDetails instance) =>
    <String, dynamic>{
      'tmdbId': instance.tmdbId,
      'title': instance.title,
      'overview': instance.overview,
      'posterUrl': instance.posterUrl,
      'backdropPath': instance.backdropPath,
      'releaseDate': instance.releaseDate,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'runtime': instance.runtime,
    };
