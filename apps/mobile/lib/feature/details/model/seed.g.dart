// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Seed _$SeedFromJson(Map<String, dynamic> json) => _Seed(
  guid: json['guid'] as String,
  title: json['title'] as String,
  externalLink: json['externalLink'] as String,
  tmdbId: (json['tmdbId'] as num).toInt(),
);

Map<String, dynamic> _$SeedToJson(_Seed instance) => <String, dynamic>{
  'guid': instance.guid,
  'title': instance.title,
  'externalLink': instance.externalLink,
  'tmdbId': instance.tmdbId,
};
