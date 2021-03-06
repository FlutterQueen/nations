import 'package:flutter/material.dart';
import 'package:flutter_readable/flutter_readable.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/loaders/nation_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kPrefsKey = 'queen.nations.lang';

/// * # Global object to handle the localizations actions
// ignore: non_constant_identifier_names
final Nations = NationsBase._();

/// nations base class
class NationsBase extends ChangeNotifier {
  NationsBase._();

  // final delegate = _NationsDelegate();

  /// * falls back to arabic by default
  NationsConfig _currentConfig = NationsConfig();

  /// return the current config
  NationsConfig get config => _currentConfig;

  Locale? _currentLocale;
  late SharedPreferences _prefs;

  /// set up Nations controller
  Future<void> boot([
    NationsConfig? config,
  ]) async {
    assert(
      () {
        if (config != null) {
          return config.fallbackLocale.isSupported;
        }
        return true;
      }(),
      'fallback locale must be supported',
    );

    ///* for shared prefs
    WidgetsFlutterBinding.ensureInitialized();

    ///* init shared prefs
    _prefs = await SharedPreferences.getInstance();

    ///* set the config
    _currentConfig = config ?? _currentConfig;

    final _savedLocale = _prefs.getString(_kPrefsKey);

    /// if there is a save locale and still supported use it
    if (_savedLocale != null && Locale(_savedLocale).isSupported) {
      _currentLocale = Locale(_savedLocale);

      /// if no check if the device locale is supported or not
    } else if (Nations.deviceLocale.isSupported) {
      _currentLocale = Nations.deviceLocale;
    } else {
      _currentLocale = _currentConfig.fallbackLocale;
    }

    //*/
    if (_savedLocale == null) {
      if (Nations.deviceLocale.isSupported) {
        _currentLocale = Nations.deviceLocale;
      } else {
        _currentLocale = _currentConfig.fallbackLocale;
      }
    } else {
      _currentLocale = Locale(_savedLocale);
    }

    await load(locale);
  }

  /// * updates the current locale the restart the app (notify the root builder)
  Future<void> updateLocale(Locale locale) async {
    _currentLocale = locale;
    await _prefs.setString(_kPrefsKey, locale.toString());
    await load(locale);
  }

  /// * get the current locale
  Locale get locale => _currentLocale ?? config.fallbackLocale;

  /// * return the supported locales list from the config
  List<Locale> get supportedLocales => config.supportedLocales;

  final _translations = <String, Object?>{};

  /// return the loaded translations
  Map<String, Object?> get translations => _translations;

  /// used by this class only to load the translations when locale changes
  @protected
  @visibleForTesting
  Future<void> load(Locale locale) async {
    /// for each loader add the values to the translation map
    final _app = <String, Object?>{};

    for (final loader in Nations.config.loaders) {
      _app[loader.name] = await loader.load(locale);
    }

    _app.addAll(const NationsAssetsLoader().load(locale));
    final baseData = await Nations.config.baseLoader.load(locale);

    final result = mergeTwoMaps(_app, baseData)?.cast<String, Object?>();

    /// * clear the old translations

    _translations
      ..clear()
      ..addAll(result ?? {});

    notifyListeners();
  }
}
