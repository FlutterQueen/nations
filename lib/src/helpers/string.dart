import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// localize numbers base on locale
/// if none provided it will use the app locale `Nations.locale`
/// Make sure you know the difference between arabic and hindi numbers
String numberToLocale(String str, [Locale? locale]) {
  if (str.isEmpty) return str;
  switch (locale?.languageCode) {
    case null:
      return numberToLocale(str, Nations.config.fallbackLocale);
    case 'ar':
      return convertToArabicNumbers(str);
    case 'hi':
      return convertToHindiNumbers(str);
  }
  return str;
}

/// arabic numbers are `0123456789`
String convertToArabicNumbers(String str) => str;

/// arabic numbers are `٠١٢٣٤٥٦٧٨٩`
String convertToHindiNumbers(String str) => str;

/// takes `foo` return `Foo`
/// takes `foo bar` return `Foo bar`
String capitalizeFirstChar(String str) {
  return '${str[0].toUpperCase()}${str.substring(1)}';
}

/// takes `foo` return `Foo`
/// takes `foo bar` return `Foo Bar`
/// takes `foo bar zee` return `Foo Bar Zee`
String capitalizeFirstCharForEachWord(String str) {
  return str
      .split(" ")
      .map((s) => s.isEmpty ? '' : capitalizeFirstChar(s))
      .join(" ");
}
