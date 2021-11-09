import 'package:flutter/material.dart';
import 'package:nations/src/models/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * # Global object to handle the localizations actions
// ignore: non_constant_identifier_names
final Nations = NationsBase._();

class NationsBase extends ChangeNotifier {
  NationsBase._();

  /// * falls back to arabic by default
  NationsConfig _currentConfig = NationsConfig();
  NationsConfig get config => _currentConfig;

  Locale? _currentLocale;
  late SharedPreferences _prefs;
  Future<void> boot([
    NationsConfig? config,
  ]) async {
    ///* for shared prefs
    WidgetsFlutterBinding.ensureInitialized();

    ///* init shared prefs
    _prefs = await SharedPreferences.getInstance();

    ///* set the config
    _currentConfig = config ?? _currentConfig;

    final _savedLocale = _prefs.getString('queen.nations.lang');

    _currentLocale = _savedLocale == null
        ? this.config.fallbackLocale
        : Locale(_savedLocale);
  }

  Future<void> updateLocale(Locale locale) async {
    _currentLocale = locale;
    notifyListeners();
    await _prefs.setString('nations_lang', locale.toString());
  }

  /// * get the current locale
  Locale get locale => _currentLocale ?? config.fallbackLocale;

  List<Locale> get supportedLocales => config.supportedLocales;

  Map<String, dynamic>? _translations;

  Map<String, dynamic> get translations {
    if (_translations != null) {
      return _translations!;
    }

    throw Exception('''
    translations not loaded
    make sure you added the delegates to your app
    ''');
  }

  Future<Map<String, dynamic>> load(Locale locale) async {
    _translations = await config.loader.loadWithNationValues(locale);
    return translations;
  }
}
