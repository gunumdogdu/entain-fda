import 'package:flutter/material.dart';

class AppStateModel {
  AppStateModel({required ThemeData themeData}) : _themeData = themeData;

  ThemeData _themeData;

  ThemeData get themeData => _themeData;
  set themeData(ThemeData value) => _themeData = value;
}
