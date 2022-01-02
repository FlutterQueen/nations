import 'package:flutter_readable/flutter_readable.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/helpers/extractors.dart';
part 'string.dart';
part 'map.dart';
part 'not_found.dart';

/// base class for extracted data result
abstract class ExtractedData<T> {
  /// creates a new instance of ExtractedData
  ExtractedData({
    required this.key,
    required this.data,
  });
  // * extracted data key
  /// in case of `'foo'.tr` the key is `'foo'`
  final String key;

  /// in case of `{"foo":"bar"` the data is `"bar"`
  final T data;

  ///* crates new ExtractedData instance from the loaded translations
  static ExtractedData parse(String key) {
    /// * the data from

    final value = findInMap(key, Nations.translations);

    if (value is String) {
      return StringData(key, value);
    } else if (value is Map<String, Object?>) {
      return MapData(key, value);
    }
    return NotFoundData(key);
  }

  /// convert the result with pluralization
  String? text() => null;

  /// convert the result with pluralization
  String? plural(int count, [Map<String, Object>? args]) => null;

  /// convert the result with the gender
  String? toGender([Gender? gender]) => null;

  /// replace the arguments of the string
  String? args(Map<String, Object> args) => null;
}
