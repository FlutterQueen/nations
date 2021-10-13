// ignore_for_file: non_constant_identifier_names

import 'dart:developer' show log;
import 'dart:ui' show window;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nations/src/models/config.dart';
import 'package:nations/src/models/translations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'delegate.dart';

class NationsBase extends ChangeNotifier {
  /// * falls back to arabic by default
  NationsConfig config = NationsConfig();

  //  Locale? _initialLocale;
  Locale? _currentLocale;
  late SharedPreferences _prefs;
  Future<void> boot(
    NationsConfig config,
  ) async {
    log('config updated');
    this.config = config;
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    final _savedLocale = _prefs.getString('nations_lang');
    if (_savedLocale != null) _currentLocale = Locale(_savedLocale);
  }

  /// * device locale
  Locale get deviceLocale => window.locale;

  Future<void> updateLocale(Locale locale) async {
    log('new locale is $locale');
    _currentLocale = locale;
    notifyListeners();
    await _prefs.setString('nations_lang', locale.toString());
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
