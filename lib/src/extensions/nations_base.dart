import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nations/nations.dart';
import 'dart:ui' show window;

import '../delegate.dart';

/// additional features to the NationsBase
extension NationsBaseExt on NationsBase {
  /// * return `OS` Locale
  Locale get deviceLocale => window.locale;

  /// * use it to make the `App` loads the data when the language changes
  List<LocalizationsDelegate> get delegates => <LocalizationsDelegate>[
        const NationsLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];
}
