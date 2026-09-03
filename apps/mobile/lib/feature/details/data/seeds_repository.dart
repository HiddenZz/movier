import 'package:dio/dio.dart';
import 'package:movier/feature/details/model/seed.dart';

abstract interface class SeedsRepository {
  Future<List<Seed>> fetchById(int id);
}

class SeedsRepositoryImpl implements SeedsRepository {
  const SeedsRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Seed>> fetchById(int id) async {
    final response = await _dio.get('/seeds/', queryParameters: <String, Object>{'movieId': id});

    if (response.data case List<Object?> jsons) {
      return jsons.whereType<Map<String, Object?>>().map(Seed.fromJson).toList();
    }

    throw Exception('Fetch seeds returned invalid response');
  }
}
