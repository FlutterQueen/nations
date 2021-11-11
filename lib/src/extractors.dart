import 'package:nations/nations.dart';
import 'helpers/extractors.dart';
import 'helpers/validation.dart';

class ExtractedData<T> {
  // * extracted data key
  /// in case of `'foo'.tr` the key is `'foo'`
  final String key;

  /// in case of `{"foo":"bar"` the data is `"bar"`
  final T data;

  ExtractedData({
    required this.key,
    required this.data,
  });

  String notFound() => Nations.config.notFoundBuilder(key);

  ///* crates new ExtractedData instance from the loaded translations
  static ExtractedData parse(String key) {
    /// * the data from
    final value = transFromMap(key, Nations.translations);
    if (value == null) {
      return NotFoundData(key);
    } else if (value is String) {
      return StringData(key, value);
    } else if (value is Map) {
      return MapData(key, value);
    }
    return NotFoundData(key);
  }

  @override
  String toString() => notFound();

  String plural(int count, [Map<String, dynamic>? args]) => notFound();

  String toGender([Gender? gender]) => notFound();

  String args(Map<String, dynamic> args) => notFound();
}

class NotFoundData extends ExtractedData {
  NotFoundData(String key) : super(key: key, data: null);
}

class StringData extends ExtractedData<String> {
  StringData(String key, String value) : super(key: key, data: value);

  @override
  String args(Map<String, dynamic> args) => replaceArgsOf(data, args);

  @override
  String toString() => data;
}

class MapData extends ExtractedData<Map> {
  MapData(String key, Map value) : super(key: key, data: value);
  @override
  String toGender([Gender? gender]) {
    if (isValidGenderMap(data)) {
      switch (gender) {
        case null:
          return toGender(Nations.config.defaultGender);
        case Gender.male:
          return data['male'];
        case Gender.female:
          return data['female'];
      }
    }
    return notFound();
  }

  @override
  String plural(int count, [Map<String, dynamic>? args]) {
    if (isValidArgs(data)) {
      final pluralKey = resolveCount(
            count,
            (data as Map<String, dynamic>).keys.toList(),
          ) ??
          Nations.config.notFoundBuilder(key);
      if ((data)[pluralKey] == null) return notFound();
      return replaceArgsOf(
        (data)[pluralKey],
        {'count': count.toString(), if (args != null) ...args},
      );
    }
    return notFound();
  }
}
