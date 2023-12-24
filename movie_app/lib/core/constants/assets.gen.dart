/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsEnvironmentGen {
  const $AssetsEnvironmentGen();

  /// File path: assets/environment/dev.env
  String get dev => 'assets/environment/dev.env';

  /// List of all assets
  List<String> get values => [dev];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/action.jpg
  AssetGenImage get action => const AssetGenImage('assets/images/action.jpg');

  /// File path: assets/images/adventure.jpeg
  AssetGenImage get adventure =>
      const AssetGenImage('assets/images/adventure.jpeg');

  /// File path: assets/images/animation.jpg
  AssetGenImage get animation =>
      const AssetGenImage('assets/images/animation.jpg');

  /// File path: assets/images/comedia.jpg
  AssetGenImage get comedia => const AssetGenImage('assets/images/comedia.jpg');

  /// File path: assets/images/horror.jpg
  AssetGenImage get horror => const AssetGenImage('assets/images/horror.jpg');

  /// File path: assets/images/science_fiction.jpg
  AssetGenImage get scienceFiction =>
      const AssetGenImage('assets/images/science_fiction.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [action, adventure, animation, comedia, horror, scienceFiction];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/no_connection.json
  String get noConnection => 'assets/lotties/no_connection.json';

  /// File path: assets/lotties/no_data.json
  String get noData => 'assets/lotties/no_data.json';

  /// List of all assets
  List<String> get values => [noConnection, noData];
}

class Assets {
  Assets._();

  static const $AssetsEnvironmentGen environment = $AssetsEnvironmentGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
