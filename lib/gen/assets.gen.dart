/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.svg
  String get arrowLeft => 'assets/icons/arrow_left.svg';

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/download.svg
  String get download => 'assets/icons/download.svg';

  /// File path: assets/icons/eraser.svg
  String get eraser => 'assets/icons/eraser.svg';

  /// File path: assets/icons/gallery.svg
  String get gallery => 'assets/icons/gallery.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/palette.svg
  String get palette => 'assets/icons/palette.svg';

  /// File path: assets/icons/pattern.svg
  String get pattern => 'assets/icons/pattern.svg';

  /// File path: assets/icons/pencil.svg
  String get pencil => 'assets/icons/pencil.svg';

  /// File path: assets/icons/star_off.svg
  String get starOff => 'assets/icons/star_off.svg';

  /// File path: assets/icons/star_on.svg
  String get starOn => 'assets/icons/star_on.svg';

  /// File path: assets/icons/tick_off.svg
  String get tickOff => 'assets/icons/tick_off.svg';

  /// File path: assets/icons/tick_on.svg
  String get tickOn => 'assets/icons/tick_on.svg';

  /// List of all assets
  List<String> get values => [
        arrowLeft,
        check,
        download,
        eraser,
        gallery,
        logout,
        palette,
        pattern,
        pencil,
        starOff,
        starOn,
        tickOff,
        tickOn
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashScreen];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
