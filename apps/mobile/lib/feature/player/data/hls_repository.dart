import 'package:dio/dio.dart';
import 'package:movier/feature/player/data/hls_playlist_mapper.dart';
import 'package:movier/feature/player/model/hls_variant.dart';

export 'package:movier/feature/player/model/hls_variant.dart';

abstract interface class HlsRepository {
  /// Reads the master playlist of [contentUuid] and returns its renditions.
  ///
  Future<List<HlsVariant>> fetchVariants(String contentUuid);
}

class HlsRepositoryImpl implements HlsRepository {
  const HlsRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<HlsVariant>> fetchVariants(String contentUuid) async {
    final response = await _dio.get<String>(
      '/stream/$contentUuid/master.m3u8',
      options: Options(responseType: ResponseType.plain),
    );

    if (response.data case final String body when body.isNotEmpty) {
      return HlsPlaylistMapper.variants(body);
    }

    throw const FormatException('Master playlist is empty');
  }
}
