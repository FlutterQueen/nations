import 'dart:async';

import 'package:flutter/material.dart';

import '../../nations.dart';
import '../helpers/files.dart';

/// * loads translation form assets or any source
/// * extend it to build you custom loader if none of the existing
/// * fits your needs
abstract class NationsLoader {
  
  const NationsLoader();

  ///* loads the data from you files
  FutureOr<Map<String, dynamic>?> load(Locale locale);

  /// * loads your assets with nation assets
  Future<Map<String, dynamic>> loadWithNationValues(Locale locale) async {
    /// loads the application assets
    final values = (await load(locale)) ??
        (await load(Locale(locale.languageCode))) ??
        (await load(Nations.config.fallbackLocale)) ??
        (await load(Locale(Nations.config.fallbackLocale.languageCode))) ??
        {};

    /// loads the application assets
    final nationValues = (await loadPackageTranslation(locale)) ??
        (await loadPackageTranslation(Locale(locale.languageCode))) ??
        (await loadPackageTranslation(Nations.config.fallbackLocale)) ??
        (await loadPackageTranslation(
            Locale(Nations.config.fallbackLocale.languageCode))) ??
        {};

    /// * merging the assets to save memory
    return {}
      ..addAll(nationValues)
      ..addAll(values);
  }
}
