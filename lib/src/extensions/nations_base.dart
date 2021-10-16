import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nations/nations.dart';
import 'dart:ui' show window;

import '../delegate.dart';
import '../typedef.dart';

/// additional features to the NationsBase
extension NationsBaseExt on NationsBase {
  /// * is the current app `Locale` direction is RTL
  bool get isRTL => isRtlLocale(locale);

  /// * is the current app `Locale` direction is LTR
  bool get isLTR => !isRTL;

  /// * return the `TextDirection` base on the app current `locale`
  TextDirection get direction => textDirectionByLocale(Nations.locale);

  /// * return the `TextDirection` **Reversed** based on the app current locale`
  TextDirection get reversedDirection =>
      isRTL ? TextDirection.ltr : TextDirection.ltr;

  /// * device locale
  Locale get deviceLocale => window.locale;

  /// *
  List<LocalizationsDelegate> get delegates => <LocalizationsDelegate>[
        const NationsLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  NotFoundBuilder get notFoundBuilder => config.notFoundBuilder;
  Gender get defaultGender => config.defaultGender;
}
