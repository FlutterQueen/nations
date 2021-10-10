import 'package:flutter/material.dart';

/// return the string without any decoration
/// Example :  TODO ::
/// // TODO :: regular to replace any nation decoration
String removeDecoration(String value) {
  throw UnimplementedError();
}

/// localize numbers base on locale
/// if none provided it will use the app locale `Nations.locale`
/// Example
// TODO numberToLocale
String numberToLocale(String str, [Locale? locale]) {
  throw UnimplementedError();
}

String capitalizeFirstChar(String str) {
  return '${str[0].toUpperCase()}${str.substring(1)}';
  // return str.replaceRange(0, 1, str[0].toUpperCase());
}

String capitalizeFirstCharForEachWord(String str) {
  return str
      .split(" ")
      .map((s) => s.isEmpty ? '' : capitalizeFirstChar(s))
      .join(" ");
}
