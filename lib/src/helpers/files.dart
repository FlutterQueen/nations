import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// *  load translation files from the `nations` package base on the locale
Future<Map<String, dynamic>> loadPackageTranslation(Locale locale) async {
  return loadJsonFileContent('packages/nations/assets/lang/$locale.json');
}

/// *  load the locale from json files
// TODO :: load any failure translation ar_EG , ar
Future<Map<String, dynamic>> loadLocaleTranslation(Locale locale) async {
  return loadJsonFileContent('lang/$locale.json');
}

/// *  load the locale from json files
Future<Map<String, dynamic>> loadJsonFileContent(String path) async {
  // *  parse it to string
  return json.decode(
    /// *  load content
    await rootBundle.loadString(path),
  );
}
