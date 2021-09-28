// ignore_for_file: non_constant_identifier_names

import 'dart:developer' show log;
import 'dart:ui' show window;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import '../nations.dart';
import 'delegate.dart';
import 'loaders.dart';

// * # Global object to handle the loclizations actions
final Nations = _NationsController();

class _NationsController extends ChangeNotifier {
  /// * falls back to arabic by defult
  Locale? _fallbackLocale;
  //  Locale? _initalLocale;
  Locale? _currentLocale;

  void config({
    Locale fallbackLocale = const Locale('ar'),
    // Locale? initalLocale = const Locale('ar'),
    NationsLoader loader = const NationsJsonLoader(),
    List<Locale> supportedLocales = const [
      // * localization in arab
      Locale('ar'),
      Locale('en'),
    ],
  }) {
    log('[👑][Nations]fallbacklocale updated from $fallbackLocale to $locale ✔');
    _fallbackLocale = locale;

    // log('[👑][Nations]lodaer updated from $_loader ??  to $loader ✔');
    _loader = loader;

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

  late NationsLoader _loader;
  var _translations = NTranslations(values: {}, nationValues: {});
  NTranslations get translations => _translations;
  Future<NTranslations> load(Locale locale) async {
    _translations = await _loader.loadWithNationValues(locale);
    return _translations;
  }

  final delegates = const <LocalizationsDelegate>[
    NationsLocalizationsDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
