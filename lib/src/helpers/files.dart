import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nations/nations.dart';

/// *  load translation files from the `nations` package base on the locale
/// * if the locale doesn't exist in your assets it will try to get the file named with the language code
/// * if also is empty it will loads the fallback locale
Future<Map<String, dynamic>?> loadPackageTranslation(Locale locale) async {
  return loadJsonFileContent(
    'packages/nations/assets/lang/$locale.json',
  );
}

/// *  load the locale from json files
/// * if the locale doesn't exist in your assets it will try to get the file named with the language code
/// * if also is empty it will loads the fallback locale
Future<Map<String, dynamic>?> loadLocaleTranslation(Locale locale) async {
  return loadJsonFileContent('lang/${Nations.config.fallbackLocale}.json');
}

/// *  load the locale from json files
Future<Map<String, dynamic>?> loadJsonFileContent(String path) async {
  try {
    // *  parse it to string
    return json.decode(
      /// *  load content
      await rootBundle.loadString(path),
    );
  } on FlutterError {
    return null;
  }
}
