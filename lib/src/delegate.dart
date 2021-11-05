import 'package:flutter/material.dart';

import '../nations.dart';

class NationsLocalizationsDelegate
    extends LocalizationsDelegate<Map<String, dynamic>> {
  const NationsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Nations.supportedLocales.contains(locale);

  /// called by flutter when locale is change
  @override
  Future<Map<String, dynamic>> load(Locale locale) => Nations.load(locale);

  @override
  bool shouldReload(old) => false;
}
