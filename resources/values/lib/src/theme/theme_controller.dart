import 'package:flutter/material.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
  }
}
