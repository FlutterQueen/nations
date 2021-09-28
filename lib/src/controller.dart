part of '../nations.dart';

// * # Global object to handle the loclizations actions
// ignore: non_constant_identifier_names
final Nations = _NationsController();

class _NationsController extends ChangeNotifier {
  /// * falls back to arabic by defult
  Locale? _fallbackLocale;
  // Locale? _initalLocale;
  Locale? _currentLocale;

  void config({
    Locale fallbackLocale = const Locale('ar'),
    // Locale? initalLocale = const Locale('ar'),
    NationsLoader loader = const NationsJsonLoader(),
    List<Locale> supportedLocales = const [
      Locale('ar'),
      Locale('en'),
    ],
  }) {
    // TODO :: use palace logger
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
    // TODO :: Log
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
    _NationsLocalizationsDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
