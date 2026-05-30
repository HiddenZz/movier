import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.freezed.dart';
part 'seed.g.dart';

/// Seed data class
@freezed
abstract class Seed with _$Seed {
  const factory Seed({required String guid, required String title, required String externalLink, required int tmdbId}) =
      _Seed;

  const Seed._();

  /// Generate Seed class from Map<String, Object?>
  factory Seed.fromJson(Map<String, Object?> json) => _$SeedFromJson(json);
}
