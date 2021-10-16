import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

extension NLocaleExt on Locale {
  bool get isRtl => isRtlLocale(this);
  bool get isLtr => !isRtl;
  TextDirection get direction => textDirectionByLocale(this);
}
