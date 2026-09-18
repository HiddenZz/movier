// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchData _$SearchDataFromJson(Map<String, dynamic> json) => _SearchData(
  page: (json['page'] as num).toInt(),
  results: (json['results'] as List<dynamic>).map((e) => MoviePreview.fromJson(e as Map<String, dynamic>)).toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SearchDataToJson(_SearchData instance) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'totalPages': instance.totalPages,
  'totalResults': instance.totalResults,
};
