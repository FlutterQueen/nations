import 'package:flutter/material.dart';

String removeDecoration(String value) {
  // TODO :: regular to replace any nation decoration
  return value.replaceAll('from', 'replace');
}

/// localize numbers base on locale
/// if none provided it will use the app locale `Nations.locale`
// TODO numberToLocale
String numberToLocale(String str, [Locale? locale]) {
  throw UnimplementedError();
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
