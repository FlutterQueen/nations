part of '../nations.dart';

/// holds translations and extracting the values
class NTranslations {
  final Map<String, dynamic> values;
  final Map<String, dynamic> nationValues;

  NTranslations({
    required this.values,
    required this.nationValues,
  });

  String tr(String key) {
    final fromValues = _transFromMap(key, values);
    if (fromValues != null) return fromValues;
    log(
      'key $key does not exist in the project '
      'lang files with the locale ${Nations.locale} ,, '
      'trying to get it from the nations ....',
    );
    final fromNation = _transFromMap(key, nationValues);
    if (fromNation != null) return fromNation;
    log(
      'key $key does not exist in nation files also the project '
      'lang files with the locale ${Nations.locale} ,, '
      'trying to get it from the nations ....',
    );
    log('cant get from the nation will return null then !');
    return 'null';
  }

  String? _transFromMap(String key, Map<String, dynamic> values) {
    return values[key];
  }
}
