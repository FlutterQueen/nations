import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/translations.dart';

import 'helpers/files.dart';

/// * loads translation form assets or any source
/// * extend it to build you custom loader if none of the existing
/// * fits your needs
abstract class NationsLoader {
  const NationsLoader();

  ///* loads the data from you files
  Future<Map<String, dynamic>> load(Locale locale);

  Future<NTranslations> loadWithNationValues(Locale locale) async {
    // TODO :: load any failure translation ar_EG , ar
    return NTranslations(
      values: await load(locale),
      nationValues: await loadPackageFileContent(locale),
    );
  }
}

/// * to load lang files from 'assets/lang/'
class NationsJsonLoader extends NationsLoader {
  const NationsJsonLoader();
  @override
  Future<Map<String, dynamic>> load(locale) => loadJsonFileContent(locale);

  @override
  String toString() => 'NationsJsonLoader';
}
