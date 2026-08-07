import 'package:dio/dio.dart';
import 'package:movier/feature/details/model/movie_details.dart';

abstract interface class MovieRepository {
  Future<MovieDetails> detail(int tmdbId);
}

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<MovieDetails> detail(int tmdbId) async {
    final response = await _dio.get('/movie/$tmdbId');

    if (response.data case final Map<String, Object?> json when json.isNotEmpty) {
      return MovieDetails.fromJson(json);
    }

    throw Exception('Movie not found');
  }
}
