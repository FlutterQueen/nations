import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// *  load translation files from the `nations` package base on the locale
/// * if the locale doesn't exist in your assets it will try to get
/// *  the file  named with the language code
/// * if also is empty it will loads the fallback locale
// Future<Map<String, dynamic>?> loadPackageTranslation({
//   required Locale locale,
//   required String packageName,
// }) async {
//   return loadJsonFileContent(
//     'packages/$packageName/assets/lang/$locale.json',
//   );
// }

/// *  load the locale from json files
/// * if the locale doesn't exist in your assets it will try to get
/// * the file named with the language code
/// * if also is empty it will loads the fallback locale
Future<Map<String, dynamic>?> loadLocaleTranslation(Locale locale) async {
  return loadJsonFileContent('assets/lang/$locale.json');
}

/// *  load the locale from json files
/// * why null ? because the file might be corrupted some how or missing a comma in the end !
Future<Map<String, dynamic>?> loadJsonFileContent(String path) async {
  try {
    // *  parse it to string
    return json.decode(
      /// *  load content
      await rootBundle.loadString(path),
    ) as Map<String, dynamic>?;
  } catch (_) {
    return null;
  }
}
