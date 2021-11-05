import 'package:flutter/material.dart';
import 'package:nations/src/models/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * # Global object to handle the localizations actions
// ignore: non_constant_identifier_names
final Nations = NationsBase._();

class NationsBase extends ChangeNotifier {
  NationsBase._();

  /// * falls back to arabic by default
  NationsConfig config = NationsConfig();

  //  Locale? _initialLocale;
  late Locale _currentLocale;
  late SharedPreferences _prefs;
  Future<void> boot(
    NationsConfig config,
  ) async {
    this.config = config;
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    final _savedLocale = _prefs.getString('nations_lang');
    if (_savedLocale != null) {
      _currentLocale = Locale(_savedLocale);
    } else {
      _currentLocale = config.fallbackLocale;
    }
  }

  Future<void> updateLocale(Locale locale) async {
    _currentLocale = locale;
    notifyListeners();
    await _prefs.setString('nations_lang', locale.toString());
  }

  /// * get the current locale
  Locale get locale => _currentLocale;

  List<Locale> get supportedLocales => config.supportedLocales;

  late Map<String, dynamic> _translations;

  Map<String, dynamic> get translations => _translations;

  Future<Map<String, dynamic>> load(Locale locale) async {
    _translations = await config.loader.loadWithNationValues(locale);
    return _translations;
  }
}
