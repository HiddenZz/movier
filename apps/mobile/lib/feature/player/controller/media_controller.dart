import 'dart:async';

import 'package:control/control.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:movier/feature/player/data/hls_repository.dart';

part 'media_controller.freezed.dart';

/// Playback speeds offered in the speed menu.
const List<double> kPlaybackRates = <double>[0.5, 0.75, 1.0, 1.25, 1.5, 2.0];

@freezed
sealed class MediaState with _$MediaState {
  const MediaState._();

  const factory MediaState.processing({
    @Default('processing') String message,
    @Default(<HlsVariant>[]) List<HlsVariant> variants,
    HlsVariant? selected,
    @Default(1.0) double rate,
    Object? error,
  }) = Processing$MediaState;

  const factory MediaState.idle({
    @Default('idle') String message,
    @Default(<HlsVariant>[]) List<HlsVariant> variants,
    HlsVariant? selected,
    @Default(1.0) double rate,
    Object? error,
  }) = Idle$MediaState;

  const factory MediaState.failure({
    @Default('failure') String message,
    @Default(<HlsVariant>[]) List<HlsVariant> variants,
    HlsVariant? selected,
    @Default(1.0) double rate,
    Object? error,
  }) = Failure$MediaState;

  /// Whether the quality menu has anything to choose between.
  bool get hasQualityChoice => variants.length > 1;
}

/// Owns the [Player] and its [VideoController] for a single content item.
///
/// Only slow-moving data lives in [MediaState]: the rendition list, the
/// selected quality and the playback rate. Position, buffer and playing flags
/// are read straight from [Player.stream] by the widgets that need them, so a
/// position tick does not rebuild the whole tree.
final class MediaController extends StateController<MediaState> with SequentialControllerHandler {
  MediaController({required HlsRepository repository})
    : _repository = repository,
      super(initialState: const MediaState.idle()) {
    // Attach before any [load] so `open` waits for the texture instead of
    // racing the first build, which is when a lazy controller would appear.
    videoController = VideoController(player);
    _errorSubscription = player.stream.error.listen(_onPlayerError);
  }

  final HlsRepository _repository;

  final Player player = Player();
  late final VideoController videoController;
  late final StreamSubscription<String> _errorSubscription;

  /// Guards against the [Player] being used after [dispose].
  ///
  /// Every mutating method of [Player] asserts on a disposed instance, and the
  /// assertion is thrown from inside its internal lock — so an `open` awaited
  /// across a widget teardown can land after disposal.
  bool _disposed = false;

  /// Loads the rendition list and starts playback of the master playlist.
  Future<void> load(String contentUuid) => handle(
    () async {
      setState(MediaState.processing(message: 'Load stream for content: $contentUuid', rate: state.rate));

      final variants = await _repository.fetchVariants(contentUuid);
      if (_disposed) return;

      await player.open(Media($hlsUrl(contentUuid)));
      if (_disposed) return;

      setState(
        MediaState.idle(
          message: 'Playing master playlist for content: $contentUuid, variants: ${variants.length}',
          variants: variants,
          rate: state.rate,
        ),
      );
    },
    error: (error, stackTrace) async {
      setState(
        MediaState.failure(
          message: 'Failed to load stream for content: $contentUuid, reason: $error',
          variants: state.variants,
          selected: state.selected,
          rate: state.rate,
          error: error,
        ),
      );
    },
    name: 'MediaController.load',
  );

  /// Switches the rendition, keeping position and play/pause state.
  ///
  /// A `null` [variant] means adaptive playback of the master playlist.
  /// [Media.start] maps to the mpv `start` property, so the new variant opens
  /// at the right offset instead of opening at zero and seeking afterwards.
  /// `rate` and `volume` are global mpv properties and survive `open`.
  Future<void> selectQuality(String contentUuid, HlsVariant? variant) => handle(
    () async {
      if (variant == state.selected) return;

      final position = player.state.position;
      final wasPlaying = player.state.playing;

      setState(
        MediaState.processing(
          message: 'Switch quality to ${variant?.label ?? 'auto'} at $position',
          variants: state.variants,
          selected: variant,
          rate: state.rate,
        ),
      );

      await player.open(
        Media($hlsUrl(contentUuid, quality: variant?.quality), start: position),
        play: wasPlaying,
      );
      if (_disposed) return;

      setState(
        MediaState.idle(
          message: 'Switched quality to ${variant?.label ?? 'auto'}',
          variants: state.variants,
          selected: variant,
          rate: state.rate,
        ),
      );
    },
    error: (error, stackTrace) async {
      setState(
        MediaState.failure(
          message: 'Failed to switch quality to ${variant?.label ?? 'auto'}, reason: $error',
          variants: state.variants,
          selected: state.selected,
          rate: state.rate,
          error: error,
        ),
      );
    },
    name: 'MediaController.selectQuality',
  );

  /// Applies a playback [rate] and remembers it across quality switches.
  Future<void> setRate(double rate) => handle(
    () async {
      if (rate <= 0 || rate == state.rate) return;

      await player.setRate(rate);
      if (_disposed) return;

      setState(
        MediaState.idle(
          message: 'Playback rate set to $rate',
          variants: state.variants,
          selected: state.selected,
          rate: rate,
        ),
      );
    },
    error: (error, stackTrace) async {
      setState(
        MediaState.failure(
          message: 'Failed to set playback rate $rate, reason: $error',
          variants: state.variants,
          selected: state.selected,
          rate: state.rate,
          error: error,
        ),
      );
    },
    name: 'MediaController.setRate',
  );

  /// Surfaces playback errors reported by libmpv.
  ///
  /// `open` resolves as soon as the playlist entry is set, so a stream that
  /// fails to demux never throws — it only shows up here. Without this the
  /// screen would sit on a black frame with no explanation.
  ///
  /// Only a failure before the first decoded frame is fatal: once video
  /// dimensions exist, playback is running and a late error is usually a
  /// recoverable segment hiccup that must not replace the picture.
  void _onPlayerError(String error) {
    if (_disposed || player.state.width != null) return;

    setState(
      MediaState.failure(
        message: 'Playback error before first frame: $error',
        variants: state.variants,
        selected: state.selected,
        rate: state.rate,
        error: error,
      ),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _errorSubscription.cancel();
    // [VideoController] has no dispose of its own — its cleanup is registered
    // on the player and runs inside [Player.dispose].
    player.dispose();
    super.dispose();
  }
}
