import 'dart:developer';
import 'package:nations/nations.dart';
import 'package:nations/src/validation/gender.dart';
import 'enums.dart';

Map<String, dynamic> get _values => Nations.translations.values;
Map<String, dynamic> get _nationValues => Nations.translations.nationValues;

class ExtractedData {
  final String key;
  final dynamic data;

  ExtractedData({
    required this.key,
    required this.data,
  });
  factory ExtractedData.from(String key) => ExtractedData(
        key: key,
        data: _extract(key),
      );

  @override
  String toString() {
    if (data != null && data is String) return data;
    log('extraction is not done correctly you have to use the right extractor function');
    return Nations.config.notFoundBuilder(key);
  }

  String toGender(Gender? gender) {
    if (isValidGenderMap(data)) {
      switch (gender) {
        case null:
          return toGender(Nations.config.defaultGender);
        case Gender.male:
          return data['male'];
        case Gender.female:
          return data['female'];
      }
    } else {
      log('$key is not valid gender translation');
      return Nations.config.notFoundBuilder(key);
    }
  }

  String args(Map<String, dynamic> attributes) =>
      replaceArgsOf(data, attributes);
  String plural(int count, [Map<String, dynamic>? attributes]) {
    if (data is! Map<String, dynamic>) {
      return Nations.config.notFoundBuilder(key);
    }
    final pluralKey = resolveCount(
          count,
          (data as Map<String, dynamic>).keys.toList(),
        ) ??
        Nations.config.notFoundBuilder(key);
    return replaceArgsOf(data[pluralKey], {
      'count': count.toString(),
      if (attributes != null) ...attributes,
    });
  }
}

dynamic _transFromMap(String key, dynamic values) {
  if (values is! Map) return values;
  if (key.contains('.')) {
    final keys = key.split('.');
    if (keys.length > 1) {
      final firstArg = keys.first;
      // still want to go deeper
      log('firstArg : $firstArg');
      final newKey = key.replaceFirst('$firstArg.', '');
      log('newKey : $newKey');

      return _transFromMap(newKey, values[firstArg]);
    } else {
      return values[keys.first];
    }
  } else {
    return values[key];
  }
}

dynamic _extract(String key) {
  final fromValues = _transFromMap(key, _values);

  if (fromValues != null) return fromValues;
  log(
    'key $key does not exist in the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );
  final fromNation = _transFromMap(key, _nationValues);
  if (fromNation != null) return fromNation;
  log(
    'key $key does not exist in nation files neither the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );

  log('cant get from the nation will return null then !');
}

String? resolveCount(int count, List<String> keys) {
  for (final pluralKey in keys) {
    /// single number
    if (count.toString() == pluralKey) {
      /// *  '0' or '1'
      return pluralKey;
    } else if (pluralKey.contains(',')) {
      /// * '0,1,2,3,4'
      // set of numbers
      for (final innerNum in pluralKey.split(',')) {
        if (innerNum.toString() == count.toString()) return pluralKey;
      }
    } else if (pluralKey.contains('-')) {
      /// * 50 - 80
      /// * 50 - *  50 or more
      // its a range
      final from = num.parse(pluralKey.split('-').first);
      final _lastAsStr = pluralKey.split('-').last;
      final to = _lastAsStr == '*' ? double.infinity : num.parse(_lastAsStr);
      if (count >= from && count <= to) {
        return pluralKey;
      }
    }
  }
}
