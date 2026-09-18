import 'dart:convert';

import 'package:movier/feature/player/model/hls_variant.dart';

/// Maps a raw HLS master playlist into [HlsVariant] renditions.
///
/// Kept apart from the transport layer so the parsing rules stay testable
/// without a network client. See [HlsRepository].
abstract final class HlsPlaylistMapper {
  static const String _streamInf = '#EXT-X-STREAM-INF:';

  /// Parses `#EXT-X-STREAM-INF` lines paired with the uri line that follows.
  ///
  /// Attributes are read defensively: a missing or malformed `BANDWIDTH` or
  /// `RESOLUTION` degrades that field instead of failing the whole playlist.
  static List<HlsVariant> variants(String body) {
    final variants = <HlsVariant>[];
    final lines = const LineSplitter().convert(body);

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (!line.startsWith(_streamInf)) continue;

      final uri = _nextUriLine(lines, i);
      if (uri == null) continue;

      final quality = uri.split('/').first.trim();
      if (quality.isEmpty) continue;

      final attributes = _attributes(line.substring(_streamInf.length));
      final resolution = _resolution(attributes['RESOLUTION']);

      variants.add(
        HlsVariant(
          quality: quality,
          bandwidth: int.tryParse(attributes['BANDWIDTH'] ?? '') ?? 0,
          width: resolution?.$1,
          height: resolution?.$2,
        ),
      );
    }

    return variants;
  }

  /// First non-empty, non-comment line after [index].
  static String? _nextUriLine(List<String> lines, int index) {
    for (var i = index + 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty || line.startsWith('#')) continue;
      return line;
    }
    return null;
  }

  static Map<String, String> _attributes(String source) => <String, String>{
    for (final pair in source.split(','))
      if (pair.split('=') case [final key, final value]) key.trim().toUpperCase(): value.trim(),
  };

  static (int, int)? _resolution(String? value) => switch (value?.toLowerCase().split('x')) {
    [final width, final height] when int.tryParse(width) != null && int.tryParse(height) != null => (
      int.parse(width),
      int.parse(height),
    ),
    _ => null,
  };
}
