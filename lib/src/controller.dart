// ignore_for_file: non_constant_identifier_names

import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:nations/src/models/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'extensions/nations_base.dart';

// * # Global object to handle the localizations actions
final Nations = NationsBase._();

class NationsBase extends ChangeNotifier {
  NationsBase._();

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

  Future<void> updateLocale(Locale locale) async {
    try {
      log('new locale is $locale');
      _currentLocale = locale;
      notifyListeners();
      await _prefs.setString('nations_lang', locale.toString());
      log('sucess');
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  /// * get the current locale
  Locale get locale {
    log('locale: get $_currentLocale');
    return _currentLocale ?? config.fallbackLocale;
    // if (config.supportedLocales.contains(Nations.deviceLocale)) {
    //   return Nations.deviceLocale;
    // }
    return config.fallbackLocale;
  }

  List<Locale> get supportedLocales => config.supportedLocales;

  late Map<String, dynamic> _translations;
  Map<String, dynamic> get translations => _translations;

  Future<Map<String, dynamic>> load(Locale locale) async {
    log('will load locale $locale');
    _translations = await config.loader.loadWithNationValues(locale);
    return _translations;
  }

  Future<void> reset() async {
    _currentLocale = null;
    await load(locale);
    notifyListeners();
  }
}
