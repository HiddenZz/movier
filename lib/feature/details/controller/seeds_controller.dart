import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/details/data/seeds_repository.dart';
import 'package:movier/feature/details/model/seed.dart';

part 'seeds_controller.freezed.dart';

@freezed
sealed class SeedsState with _$SeedsState {
  const SeedsState._();

  const factory SeedsState.processing({@Default('processing') String message, @Default([]) List<Seed> seeds}) =
      Processing$SeedsState;

  const factory SeedsState.idle({@Default('idle') String message, @Default([]) List<Seed> seeds}) = Idle$SeedsState;

  const factory SeedsState.failure({@Default('failure') String message, @Default([]) List<Seed> seeds}) =
      Failure$SeedsState;
}

final class SeedsController extends StateController<SeedsState> with SequentialControllerHandler {
  SeedsController({required SeedsRepository repository})
    : _repository = repository,
      super(initialState: SeedsState.idle());

  final SeedsRepository _repository;

  Future<void> fetchById(int id, {String? movie}) => handle(
    () async {
      setState(SeedsState.processing(message: "Fetch seeds for: $movie, id: $id", seeds: state.seeds));

      final result = await _repository.fetchById(id);

      setState(SeedsState.idle(message: "Complete fetch seeds for: $movie, id: $id", seeds: result));
    },
    error: (error, stackTrace) async {
      setState(SeedsState.failure(message: "Fetch seeds during with error: $error", seeds: state.seeds));
    },
    name: 'SeedsController.fetchById',
  );
}
