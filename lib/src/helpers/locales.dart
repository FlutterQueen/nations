// source :: https://github.com/flutter/flutter/blob/e7b7ebc066c1b2a5aa5c19f8961307427e0142a6/packages/flutter_localizations/lib/src/widgets_localizations.dart#L32
import 'package:flutter/material.dart';

const _rtlLocales = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

/// return true if the locale text direction is from right to left
bool isRtlLocale(Locale locale) {
  // TODO :: make it in queen_vlidators
  return _rtlLocales.contains(locale.languageCode);
}

// * return `TextDirection` based on the provided locale
TextDirection textDirectionByLocale(Locale locale) =>
    isRtlLocale(locale) ? TextDirection.rtl : TextDirection.ltr;
