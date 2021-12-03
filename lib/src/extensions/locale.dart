import 'package:flutter/material.dart';

const _rtlLocales = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

/// extensions on the locale
extension NLocaleExt on Locale {
  /// return `true` if this language is written from `Right-to-Left`
  bool get isRTL => _rtlLocales.contains(languageCode.toLowerCase());

  /// return `true` if this language is written from `Left-to-Right`
  bool get isLTR => !_rtlLocales.contains(languageCode.toLowerCase());

  /// return the TextDirection base on the language
  TextDirection get direction =>
      _rtlLocales.contains(languageCode.toLowerCase())
          ? TextDirection.rtl
          : TextDirection.ltr;
}
