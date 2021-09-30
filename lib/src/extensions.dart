import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

import 'helpers.dart' as h;

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => h.tr(this);
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
