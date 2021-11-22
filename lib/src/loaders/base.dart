import 'dart:async';

import 'package:flutter/material.dart';

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
    final values = (await load(locale)) ?? {};

    /// loads the application assets
    final nationValues = (await loadPackageTranslation(locale)) ?? {};

    /// * merging the assets to save memory
    return {}
      ..addAll(nationValues)
      ..addAll(values);
  }
}
