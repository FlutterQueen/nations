import 'package:flutter/material.dart';

import '../nations.dart';

class NationsLocalizationsDelegate
    extends LocalizationsDelegate<Map<String, dynamic>> {
  const NationsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    print('locale $locale is supported ' +
        Nations.supportedLocales.contains(locale).toString());
    return Nations.supportedLocales.contains(locale);
  }

  /// called by flutter when locale is change
  @override
  Future<Map<String, dynamic>> load(Locale locale) async {
    await Nations.load(locale);
    return Nations.translations;
  }

  @override
  bool shouldReload(old) => false;
}
