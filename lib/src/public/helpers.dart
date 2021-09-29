import 'dart:developer';

import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

const _rtlLocales = <String>[
  'ar',
];

bool isRtlLocale(Locale locale) {
  return _rtlLocales.contains(locale.languageCode);
}

TextDirection textDirectionByLocale(Locale locale) =>
    isRtlLocale(locale) ? TextDirection.rtl : TextDirection.ltr;

Future<Map<String, dynamic>> loadJsonFileContent(Locale locale) async {
  final jString = await rootBundle.loadString('lang/$locale.json');
  final jsonMap = json.decode(jString);
  return jsonMap;
}

Future<Map<String, dynamic>> loadPackageFileContent(Locale locale) async {
  final jString = await rootBundle.loadString(
    'packages/nations/assets/lang/$locale.json',
  );
  final jsonMap = json.decode(jString);
  return jsonMap;
}

Map<String, dynamic> get _values => Nations.translations.values;
Map<String, dynamic> get _nationValues => Nations.translations.nationValues;

String tr(String key) {
  final fromValues = _transFromMap(key, _values);

  if (fromValues != null) return fromValues;
  log(
    'key $key does not exist in the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );
  final fromNation = _transFromMap(key, _nationValues);
  if (fromNation != null) return fromNation;
  log(
    'key $key does not exist in nation files neither the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );
  log('cant get from the nation will return null then !');

  return 'null';
}

String? _transFromMap(String key, Map<String, dynamic> values) {
  return values[key];
}
