import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/search/data/search_repository.dart';
import 'package:movier/feature/search/model/search_data.dart';

part 'movie_search_controller.freezed.dart';

@freezed
sealed class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState.processing({@Default('processing') String message, SearchData? data}) =
      Processing$SearchState;

  const factory SearchState.idle({@Default('idle') String message, SearchData? data}) = Idle$SearchState;

  const factory SearchState.failure({@Default('failure') String message, SearchData? data}) = Failure$SearchState;
}

final class MovieSearchController extends StateController<SearchState> with DroppableControllerHandler {
  MovieSearchController({required SearchRepository repository})
    : _repository = repository,
      super(initialState: SearchState.idle());

  final SearchRepository _repository;

  Future<void> search(String query) => handle(
    () async {
      setState(SearchState.processing(message: 'movies fetch processing', data: state.data));

      final result = await _repository.search(query);

      setState(SearchState.idle(message: 'fetched new movies', data: result));
    },
    error: (e, s) async {
      setState(SearchState.idle(message: 'error during fetch movies for q: $query reason:$e', data: state.data));
    },
  );
}
