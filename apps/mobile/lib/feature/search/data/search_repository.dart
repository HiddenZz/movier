import 'package:dio/dio.dart';
import 'package:movier/feature/search/model/search_data.dart';

abstract interface class SearchRepository {
  Future<SearchData> search(String query, [int page = 1]);
}

class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<SearchData> search(String query, [int page = 1]) async {
    final response = await _dio.get('/tmdb/search', queryParameters: <String, Object>{'query': query, 'page': page});

    if (response.data case Map<String, Object?> data when data.isNotEmpty) {
      return SearchData.fromJson(data);
    }

    throw Exception('Search returned invalid response');
  }
}
