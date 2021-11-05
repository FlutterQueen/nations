import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

extension NLocaleExt on Locale {
  /// return `true` if this language is written from `Right-to-Left`
  bool get isRTL => isRtlLocale(this);

  /// return `true` if this language is written from `Left-to-Right`
  bool get isLTR => !isRtlLocale(this);

  /// return the TextDirection base on the language
  TextDirection get direction => textDirectionByLocale(this);
}
