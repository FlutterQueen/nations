import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

import 'helpers/locales.dart';
import 'translation_methods.dart' as h;

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => h.tr(this);

  String get trMale => h.trMale(this);
  String get trFemale => h.trFemale(this);
  String gender(String key) {
    assert(['male', 'female', 'other'].contains(key.toLowerCase()));
    return h.trMale(key);
  }
  // h.tr(this);
}

extension NationsBaseExt on NationsBase {
  /// * text direction
  bool get isRTL => isRtlLocale(Nations.locale);
  bool get isLTR => !isRTL;
  TextDirection get direction => isRTL ? TextDirection.rtl : TextDirection.ltr;
  TextDirection get reverseDirection =>
      isRTL ? TextDirection.ltr : TextDirection.ltr;
}
