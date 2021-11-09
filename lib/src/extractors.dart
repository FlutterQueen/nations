import 'package:nations/nations.dart';
import 'helpers/extractors.dart';
import 'helpers/validation.dart';

class ExtractedData {
  // * extracted data key
  /// in case of `'foo'.tr` the key is `'foo'`
  final String key;

  /// in case of `{"foo":"bar"` the data is `"bar"`
  final dynamic data;

  ExtractedData({
    required this.key,
    required this.data,
  });

  ///* crates new ExtractedData instance from the loaded translations
  factory ExtractedData.from(String key) {
    /// * the data from
    final fromValues = transFromMap(key, Nations.translations);
    if (fromValues != null) return ExtractedData(key: key, data: fromValues);
    // log('cant get from the your Assets or nation will return null then !');
    return ExtractedData(key: key, data: null);
  }
  @override
  String toString() {
    if (data is String) return data;
    // log('extraction is not done correctly you have to use the right extractor function');
    return Nations.config.notFoundBuilder(key);
  }

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
    } else {
      // log('$key is not valid gender translation');
      return Nations.config.notFoundBuilder(key);
    }
  }

  String args(Map<String, dynamic> args) => replaceArgsOf(data, args);

  String plural(int count, [Map<String, dynamic>? args]) {
    if (isValidArgs(data)) {
      final pluralKey = resolveCount(
            count,
            (data as Map<String, dynamic>).keys.toList(),
          ) ??
          Nations.config.notFoundBuilder(key);
      return replaceArgsOf(
        data[pluralKey],
        {'count': count.toString(), if (args != null) ...args},
      );
    }
    return Nations.config.notFoundBuilder(key);
  }
}
