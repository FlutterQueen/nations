// ignore_for_file: non_constant_identifier_names

import 'dart:developer' show log;
import 'dart:ui' show window;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nations/src/models/config.dart';
import 'package:nations/src/models/translations.dart';

import 'delegate.dart';

class NationsBase extends ChangeNotifier {
  /// * falls back to arabic by default
  NationsConfig config = NationsConfig();

  //  Locale? _initialLocale;
  Locale? _currentLocale;

  void setConfig(
    NationsConfig config,
  ) {
    log('config updated');
    this.config = config;
  }

  /// * device locale
  Locale get deviceLocale => window.locale;

  set locale(Locale locale) {
    log('new locale is $locale');
    _currentLocale = locale;
    notifyListeners();
    // TODO :: save to locale storage
  }

  /// * get the current locale
  Locale get locale {
    if (_currentLocale != null) return _currentLocale!;
    if (config.supportedLocales.contains(deviceLocale)) return deviceLocale;
    return config.fallbackLocale;
  }

  List<Locale> get supportedLocales => config.supportedLocales;

  final delegates = <LocalizationsDelegate>[
    const NationsLocalizationsDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  late NTranslations _translations;
  NTranslations get translations => _translations;

  Future<NTranslations> load(Locale locale) async {
    _translations = await config.loader.loadWithNationValues(locale);
    return _translations;
  }

  Future<void> reset() async {
    _currentLocale = null;
    await load(locale);
    notifyListeners();
  }
}
