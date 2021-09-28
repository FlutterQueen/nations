part of '../nations.dart';

// TODO :: add more
const _rtlLocales = <String>['ar'];

bool isRtlLocale(Locale locale) {
  return _rtlLocales.contains(locale.languageCode);
}

TextDirection textDirectionByLocale(Locale locale) =>
    isRtlLocale(locale) ? TextDirection.rtl : TextDirection.ltr;

Future<Map<String, dynamic>> loadJsonFileContent(Locale locale) async {
  final jString = await rootBundle.loadString('lang/$locale.json');
  final jsonMap = json.decode(jString);
  return jsonMap;
}

Future<Map<String, dynamic>> loadPackageFileContent(Locale locale) async {
  final jString = await rootBundle.loadString(
    'packages/nations/assets/lang/$locale.json',
  );
  final jsonMap = json.decode(jString);
  return jsonMap;
}
