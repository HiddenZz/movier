import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movier/common/extensions/build_context.dart';

enum ErrorIconSize {
  ultraSmall(Size(19, 10)),
  extraSmall(Size(38, 20)),
  small(Size(47, 25)),
  medium(Size(100, 54)),
  large(Size(134, 72));

  final Size size;

  const ErrorIconSize(this.size);
}

typedef FrameBuilder = Widget Function(Widget child);

class RemoteImage extends StatelessWidget {
  final String url;
  final Color? errorBackgroundColor;
  final Color? errorIconColor;
  final ErrorIconSize errorIconSize;
  final Color? loadingBackgroundColor;
  final double loadingSize;
  final BoxFit? fit;
  final FrameBuilder? frameBuilder;
  final FrameBuilder? loadingFrameBuilder;
  final FrameBuilder? errorFrameBuilder;

  const RemoteImage(
    this.url, {
    this.errorBackgroundColor,
    this.errorIconColor,
    this.errorIconSize = ErrorIconSize.small,
    this.loadingBackgroundColor,
    this.loadingSize = 20,
    this.fit,
    this.frameBuilder,
    this.loadingFrameBuilder,
    this.errorFrameBuilder,
    super.key,
  });

  RemoteImage.uri(
    Uri uri, {
    this.errorBackgroundColor,
    this.errorIconColor,
    this.errorIconSize = ErrorIconSize.small,
    this.loadingBackgroundColor,
    this.loadingSize = 20,
    this.fit,
    this.frameBuilder,
    this.loadingFrameBuilder,
    this.errorFrameBuilder,
    super.key,
  }) : url = uri.toString();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      cacheKey: url,
      errorWidget: (e, e1, e2) {
        final child = DecoratedBox(
          decoration: BoxDecoration(
            color: errorBackgroundColor ?? context.thm.colorScheme.errorContainer,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Align(child: Icon(Icons.error, size: errorIconSize.size.longestSide)),
          ),
        );

        return errorFrameBuilder?.call(child) ?? child;
      },
      imageBuilder: (_, imageProvider) => Image(
        image: imageProvider,
        fit: fit,
        frameBuilder: (_, child, frame, _) => switch (frame) {
          final _? => frameBuilder?.call(child) ?? child,
          _ => _LoadingBuilder(loadingSize: loadingSize, frameBuilder: loadingFrameBuilder),
        },
        loadingBuilder: (_, child, progress) {
          if (progress != null) {
            return _LoadingBuilder(
              loadingSize: loadingSize,
              progress: switch (progress.expectedTotalBytes) {
                final totalBytes? => progress.cumulativeBytesLoaded / totalBytes,
                _ => null,
              },
              loadingBackgroundColor: loadingBackgroundColor,
              frameBuilder: loadingFrameBuilder,
            );
          }
          return child;
        },
      ),
      progressIndicatorBuilder: (_, _, progress) => _LoadingBuilder(
        loadingSize: loadingSize,
        progress: progress.progress,
        loadingBackgroundColor: loadingBackgroundColor,
        frameBuilder: loadingFrameBuilder,
      ),
    );
  }
}

class _LoadingBuilder extends StatelessWidget {
  final double loadingSize;
  final double? progress;
  final Color? loadingBackgroundColor;
  final FrameBuilder? frameBuilder;

  const _LoadingBuilder({this.loadingSize = 20, this.progress, this.loadingBackgroundColor, this.frameBuilder});

  @override
  Widget build(BuildContext context) {
    Widget child = Align(
      child: SizedBox.square(
        dimension: loadingSize,
        child: CircularProgressIndicator(value: progress, strokeCap: StrokeCap.round, strokeWidth: 3),
      ),
    );

    if (loadingBackgroundColor case final color?) {
      child = ColoredBox(color: color, child: child);
    }
    return frameBuilder?.call(child) ?? child;
  }
}
