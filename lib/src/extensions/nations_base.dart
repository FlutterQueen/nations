import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nations/nations.dart';
import 'dart:ui' show window;

import '../delegate.dart';

/// additional features to the NationsBase
extension NationsBaseExt on NationsBase {
  // /// * is the current app `Locale` direction is RTL
  // bool get isRTL => isRtlLocale(locale);

  // /// * is the current app `Locale` direction is LTR
  // bool get isLTR => !isRTL;

  // /// * return the `TextDirection` base on the app current `locale`
  // TextDirection get direction => textDirectionByLocale(Nations.locale);

  // /// * return the `TextDirection` **Reversed** based on the app current locale`
  // TextDirection get reversedDirection =>
  //     isRTL ? TextDirection.ltr : TextDirection.ltr;

  /// * device locale
  Locale get deviceLocale => window.locale;

  /// * use it to make the `App` loads the data when the language changes
  List<LocalizationsDelegate> get delegates => <LocalizationsDelegate>[
        const NationsLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  // * return the `default` `Gender` based on the `Config`
  Gender get defaultGender => config.defaultGender;
}
