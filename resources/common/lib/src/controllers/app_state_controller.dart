import 'package:flutter/material.dart';

import '../models/app_state_model.dart';

class AppStateController {
  static final AppStateController instance = AppStateController._();
  AppStateController._();

  final AppStateModel _model = AppStateModel(themeData: ThemeData.light());

  AppStateModel get model => _model;

  void updateTheme(ThemeData themeData) {
    _model.themeData = themeData;
  }
}
