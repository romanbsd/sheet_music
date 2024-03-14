library sheet_music;

import 'package:flutter/material.dart';

import 'util/clef_asset.dart';
import 'util/pitch_asset.dart';
import 'util/scale_asset.dart';

const String sheetMusicPackageName = "sheet_music";

/// Transparent Sheet Music View with [black] color.
class SheetMusic extends StatelessWidget {
  final bool? trebleClef;
  final String? pitch, scale;

  /// Hide the Sheet Music View.
  final bool? hide;

  /// Color of the [background], everything else will be [black].
  /// Defaults to [transparent].
  final Color? backgroundColor;

  /// Called when the [clef] section is tapped.
  final VoidCallback? clefTap;

  /// Called when the [scale] section is tapped.
  final VoidCallback? scaleTap;

  /// Called when the [note] section is tapped.
  final VoidCallback? pitchTap;

  /// Specify a [height] and [width] for the view. Default [197x100].
  final double? width, height;

  const SheetMusic({
    super.key,
    required this.trebleClef,
    required this.scale,
    required this.pitch,
    this.pitchTap,
    this.clefTap,
    this.scaleTap,
    this.backgroundColor,
    this.hide,
    this.width,
    this.height,
  });

  Widget _buildClef(
      {required double width, double? height, bool dark = false}) {
    final double width0 = width * 0.1979;
    if (dark) {
      return InkWell(
        onTap: clefTap,
        child: SizedBox(
          height: height,
          width: width0,
          child: Image.asset(
            getClefAsset(trebleClef ?? true),
            package: sheetMusicPackageName,
            fit: BoxFit.fitWidth,
            colorBlendMode: BlendMode.srcATop,
            color: Colors.white,
          ),
        ),
      );
    }
    return InkWell(
      onTap: clefTap,
      child: SizedBox(
        height: height,
        width: width0,
        child: Image.asset(
          getClefAsset(trebleClef ?? true),
          package: sheetMusicPackageName,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.srcATop,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildScale(
      {required double width, double? height, bool dark = false}) {
    final double width0 = width * 0.5076;
    if (dark) {
      return InkWell(
        onTap: scaleTap,
        child: SizedBox(
          height: height,
          width: width0,
          child: Image.asset(
            getScaleAsset(scale ?? "C Major", trebleClef: trebleClef),
            package: sheetMusicPackageName,
            fit: BoxFit.fitWidth,
            colorBlendMode: BlendMode.srcATop,
            color: Colors.white,
          ),
        ),
      );
    }
    return InkWell(
      onTap: scaleTap,
      child: SizedBox(
        height: height,
        width: width0,
        child: Image.asset(
          getScaleAsset(scale ?? "C Major", trebleClef: trebleClef),
          package: sheetMusicPackageName,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.srcATop,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPitch(
      {required double width, double? height, bool dark = false}) {
    final double width0 = width * 0.2944;
    if (dark) {
      return InkWell(
        onTap: pitchTap,
        child: SizedBox(
          height: height,
          width: width0,
          child: Image.asset(
            getPitchAsset(pitch ?? "C4", trebleClef: trebleClef),
            package: sheetMusicPackageName,
            fit: BoxFit.fitWidth,
            colorBlendMode: BlendMode.srcATop,
            color: Colors.white,
          ),
        ),
      );
    }
    return InkWell(
      onTap: pitchTap,
      child: SizedBox(
        height: height,
        width: width0,
        child: Image.asset(
          getPitchAsset(pitch ?? "C4", trebleClef: trebleClef),
          package: sheetMusicPackageName,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.srcATop,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hide != null && hide!) return Container();
    final double width = ((this.height ?? 100.0) * 197.0) / 100.0;
    final double height = ((this.width ?? 197.0) * 100.0) / 197.0;
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          color: backgroundColor,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildClef(width: width, height: height, dark: dark),
                _buildScale(width: width, height: height, dark: dark),
                _buildPitch(width: width, height: height, dark: dark),
              ]),
        ),
      ),
    );
  }
}
