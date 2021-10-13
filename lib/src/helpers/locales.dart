import 'package:flutter/material.dart';

const _rtlLocales = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

/// return true if the locale text direction is from right to left
bool isRtlLocale(Locale locale) => _rtlLocales.contains(locale.languageCode);

// * return `TextDirection` based on the provided locale
TextDirection textDirectionByLocale(Locale locale) =>
    isRtlLocale(locale) ? TextDirection.rtl : TextDirection.ltr;
