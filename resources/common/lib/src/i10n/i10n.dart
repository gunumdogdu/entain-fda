import 'package:flutter/material.dart';

import 'default_localization.dart';

///App Localization class manages labels and delegates
class AppLocalization {
  static AppLocalizationLabel of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return getLabels(locale.languageCode);
  }

  static AppLocalizationLabel getLabels(String languageCode) {
    return supportedLocalization[languageCode] ?? supportedLocalization['en']!;
  }
}

/// AppLocalizationDelegate
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalization.containsKey(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization();
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
