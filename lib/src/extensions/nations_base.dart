import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// additional features to the NationsBase
extension NationsBaseExt on NationsBase {
  /// * is the current app `Locale` direction is RTL
  bool get isRTL => isRtlLocale(Nations.locale);

  /// * is the current app `Locale` direction is LTR
  bool get isLTR => !isRTL;

  /// * return the `TextDirection` base on the app current `locale`
  TextDirection get direction => isRTL ? TextDirection.rtl : TextDirection.ltr;

  /// * return the `TextDirection` **Reversed** base on the app current locale`
  TextDirection get reversedDirection =>
      isRTL ? TextDirection.ltr : TextDirection.ltr;
}
