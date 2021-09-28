import 'package:flutter/material.dart';

import '../nations.dart';

class NationsLocalizationsDelegate
    extends LocalizationsDelegate<NTranslations> {
  const NationsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Nations.supportedLocales.contains(locale);
  }

  @override
  Future<NTranslations> load(Locale locale) async {
    final translations = Nations.load(locale);
    return translations;
  }

  @override
  bool shouldReload(old) => false;
}
