// ignore_for_file: non_constant_identifier_names

import 'dart:developer' show log;
import 'dart:ui' show window;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import '../nations.dart';
import 'delegate.dart';
import 'loaders.dart';

// * # Global object to handle the localizations actions
final Nations = NationsBase();

class NationsBase extends ChangeNotifier {
  /// * falls back to arabic by default
  Locale? _fallbackLocale;
  //  Locale? _initialLocale;
  Locale? _currentLocale;

  void config({
    Locale fallbackLocale = const Locale('ar'),
    // Locale? initialLocale = const Locale('ar'),
    NationsLoader? loader,
    List<Locale> supportedLocales = const [
      // * localization in arab
      Locale('ar'),
      Locale('en'),
    ],
  }) {
    log('[👑][Nations] fallbacklocale updated from $_fallbackLocale to $locale ✔');
    _fallbackLocale = fallbackLocale;

    if (loader != null) {
      log('[👑][Nations]loader updated from $_loader ??  to $loader ✔ ');
      _loader = loader;
    }

    //* config the supported locales
    addNewSupportedLocales(supportedLocales);
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
  Locale get locale => _currentLocale ?? _fallbackLocale ?? window.locale;

  final _supportedLocales = <Locale>[];
  List<Locale> get supportedLocales => _supportedLocales;

  void addNewSupportedLocales(List<Locale> locales) {
    log('new locales added $locales');
    _supportedLocales.addAll(locales);
  }

  NationsLoader _loader = const NationsJsonLoader();

  final delegates = <LocalizationsDelegate>[
    const NationsLocalizationsDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  late NTranslations _translations;
  NTranslations get translations => _translations;

  Future<NTranslations> load(Locale locale) async {
    _translations = await _loader.loadWithNationValues(locale);
    return _translations;
  }
}
