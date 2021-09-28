part of '../nations.dart';

class _NationsLocalizationsDelegate
    extends LocalizationsDelegate<NTranslations> {
  const _NationsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Nations.supportedLocales.contains(locale);
  }

  @override
  Future<NTranslations> load(Locale locale) async {
    final translations = Nations.load(locale);
    return translations;
  }

  @override
  bool shouldReload(_) => false;
}
