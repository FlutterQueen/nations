import 'package:flutter/material.dart';

import '../nations.dart';

class NationsLocalizationsDelegate
    extends LocalizationsDelegate<NTranslations> {
  const NationsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Nations.supportedLocales.contains(locale);
  }

  /// called by flutter when locale is change
  @override
  Future<NTranslations> load(Locale locale) async {
    await Nations.load(locale);
    return Nations.translations;
  }

  @override
  bool shouldReload(old) => false;
}
