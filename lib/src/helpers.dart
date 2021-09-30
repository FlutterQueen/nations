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
  if (key.contains('.')) {
    // TODO :: inneer data
    final value = values[key];
  } else {
    return values[key];
  }
}

// translate and  replace argument with the givin args
String args(String key, Map<String, dynamic> args) {
  String str = tr(key);
  for (final argKey in args.keys) {
    final decorateArgKey = ':' + argKey;
    if (str.contains(decorateArgKey)) {
      str = str.replaceFirst(decorateArgKey, args[argKey]);
    } else {
      log('''
      [nations] you are trying to replace arg $argKey but this arg does not exist
      { "$key" : ${tr(key)}
      ''');
    }
  }

  return str;
  // return removeDecoration(str);
}

String removeDecoration(String value) {
  // TODO :: regular to replace any nation decoration
  return value.replaceAll('from', 'replace');
}

String capitalizeFirstChar(String str) {
  return '${str[0].toUpperCase()}${str.substring(1)}';
  // return str.replaceRange(0, 1, str[0].toUpperCase());
}

String capitalizeEachWord(String str) {
  return str
      .split(" ")
      .map((s) => s.isEmpty ? '' : capitalizeFirstChar(s))
      .join(" ");
}

/// localize numbers base on locale
/// if none provided it will use the app locale `Nations.locale`
// TODO
String numberToLocale(String str, [Locale? locale]) {
  throw UnimplementedError();
}
