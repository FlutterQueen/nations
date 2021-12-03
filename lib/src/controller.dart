import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/loaders/nation_assets.dart';
import 'package:nations/src/models/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/extractors.dart';

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

    await load(_currentLocale!);
  }

  Future<void> updateLocale(Locale locale) async {
    _currentLocale = locale;
    await load(locale);
    notifyListeners();
    await _prefs.setString('nations_lang', locale.toString());
  }

  /// * get the current locale
  Locale get locale => _currentLocale ?? config.fallbackLocale;

  List<Locale> get supportedLocales => config.supportedLocales;

  final _translations = <String, Object?>{};

  Map<String, Object?> get translations => _translations;

  @protected
  @visibleForTesting
  Future<void> load(Locale locale) async {
    /// for each loader add the values to the translation map
    final _app = <String, Object?>{};

    for (final loader in Nations.config.loaders) {
      _app[loader.name] = await loader.load(locale);
    }

    _app.addAll(await const NationsAssetsLoader().load(locale));
    final baseData = await Nations.config.baseLoader.load(locale);

    final result = mergeTwoMaps(_app, baseData) as Map<String, Object?>;

    /// * clear the old translations

    _translations
      ..clear()
      ..addAll(result);
  }
}
