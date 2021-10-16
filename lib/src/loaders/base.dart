import 'package:flutter/material.dart';
import 'package:nations/src/models/translations.dart';

import '../helpers/files.dart';

/// * loads translation form assets or any source
/// * extend it to build you custom loader if none of the existing
/// * fits your needs
abstract class NationsLoader {
  const NationsLoader();

  ///* loads the data from you files
  Future<Map<String, dynamic>> load(Locale locale);

  Future<NTranslations> loadWithNationValues(Locale locale) async {
    final values = await load(locale);
    final nationValues =
        await loadPackageTranslation(Locale(locale.languageCode));
    if (values.isNotEmpty) {
      return NTranslations(
        values: values,
        nationValues: nationValues,
      );
    } else {
      return NTranslations(
        values: await load(Locale(locale.languageCode)),
        nationValues: nationValues,
      );
    }
  }
}
