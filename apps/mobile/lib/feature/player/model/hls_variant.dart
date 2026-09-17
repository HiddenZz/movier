import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/common/env/env.dart';

part 'hls_variant.freezed.dart';

/// Builds an absolute HLS url for [contentUuid].
///
/// [Env.baseUrl] is compile-time and already carries a trailing slash; the
/// repository talks to Dio with relative paths, but media_kit needs an
/// absolute one — both shapes are derived here so they cannot drift apart.
String $hlsUrl(String contentUuid, {String? quality}) => switch (quality) {
  final String quality => '${Env.baseUrl}stream/$contentUuid/$quality/playlist.m3u8',
  _ => '${Env.baseUrl}stream/$contentUuid/master.m3u8',
};

/// HlsVariant data class
///
/// A single `#EXT-X-STREAM-INF` rendition of an HLS master playlist.
@freezed
abstract class HlsVariant with _$HlsVariant {
  const factory HlsVariant({required String quality, @Default(0) int bandwidth, int? width, int? height}) = _HlsVariant;

  const HlsVariant._();

  /// Label shown in the quality menu, e.g. `1080p`.
  String get label => quality;
}
