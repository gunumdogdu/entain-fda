import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:values/src/assets/images.dart';

/// Enum for theme-dependent assets
enum ThemeAsset {
  /// Login screen image
  loginImage,
  // Add more theme-dependent assets here
}

/// Extension to get the correct asset based on theme
extension ThemeAssetExtension on ThemeAsset {
  String getAsset(BuildContext context) {
    final isDark = AppStateController.instance.model.themeData.brightness ==
        Brightness.dark;

    switch (this) {
      case ThemeAsset.loginImage:
        return isDark ? ImageAssets.hackerNewsLogoDark : ImageAssets.hackerNewsLogoLight;
    }
  }
}
