import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/details/data/movie_repository.dart';
import 'package:movier/feature/details/model/movie_details.dart';

part 'movie_detail_controller.freezed.dart';

@freezed
sealed class MovieDetailState with _$MovieDetailState {
  const MovieDetailState._();

  const factory MovieDetailState.processing({@Default('processing') String message, MovieDetails? movie}) =
      Processing$MovieDetailState;

  const factory MovieDetailState.idle({@Default('idle') String message, MovieDetails? movie}) = Idle$MovieDetailState;

  const factory MovieDetailState.failure({@Default('failure') String message, MovieDetails? movie}) =
      Failure$MovieDetailState;
}

final class MovieDetailController extends StateController<MovieDetailState> with SequentialControllerHandler {
  MovieDetailController({required MovieRepository movieRepository})
    : _movieRepository = movieRepository,
      super(initialState: MovieDetailState.idle());

  final MovieRepository _movieRepository;

  void fetch(int tmdbId) => handle(
    () async {
      setState(MovieDetailState.processing(message: 'fetch details for movie: $tmdbId'));

      final result = await _movieRepository.detail(tmdbId);

      setState(MovieDetailState.idle(message: 'compelete fetch details for movie: $tmdbId', movie: result));
    },
    error: (error, stackTrace) async {
      setState(MovieDetailState.failure(message: 'error during fetch movie $tmdbId, $error'));
    },
  );
}
