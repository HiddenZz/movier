import 'package:dio/dio.dart';

abstract interface class TorrentRepository {
  Future<void> download(String guid, int tmdbId);
}

class TorrentRepositoryImpl implements TorrentRepository {
  const TorrentRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> download(String guid, int tmdbId) =>
      _dio.post('/torrent/download/', data: <String, Object?>{'guid': guid, 'tmdbId': tmdbId});
}
