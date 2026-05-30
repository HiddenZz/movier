import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movier/feature/details/data/torrent_repository.dart';

part 'torrent_controller.freezed.dart';

@freezed
sealed class TorrentState with _$TorrentState {
  const TorrentState._();

  const factory TorrentState.processing({@Default('processing') String message}) = Processing$TorrentState;

  const factory TorrentState.idle({@Default('idle') String message}) = Idle$TorrentState;

  const factory TorrentState.failure({@Default('failure') String message}) = Failure$TorrentState;
}

final class TorrentController extends StateController<TorrentState> with SequentialControllerHandler {
  TorrentController({required TorrentRepository repository})
    : _repository = repository,
      super(initialState: TorrentState.idle());

  final TorrentRepository _repository;

  Future<void> downloadRequest(String guid, int tmdbId) => handle(
    () async {
      setState(TorrentState.processing(message: 'Processing fetch request download for $guid'));

      await _repository.download(guid, tmdbId);

      setState(TorrentState.idle(message: 'Complete request download for $guid'));
    },
    error: (error, stackTrace) async {
      setState(TorrentState.failure(message: 'Failure during request download for $guid'));
    },
  );
}
