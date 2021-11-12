import 'package:nations/nations.dart';
import 'package:nations/src/helpers/extractors.dart';
import 'package:nations/src/helpers/validation.dart';
part 'string.dart';
part 'map.dart';
part 'not_found.dart';

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

  String get notFound => Nations.config.notFoundBuilder(key);

  ///* crates new ExtractedData instance from the loaded translations
  static ExtractedData parse(String key) {
    /// * the data from
    final value = transFromMap(key, Nations.translations);
    if (value == null) {
      return NotFoundData(key);
    } else if (value is String) {
      return StringData(key, value);
    } else if (value is Map<String, dynamic>) {
      return MapData(key, value);
    }
    return NotFoundData(key);
  }

  @override
  String toString() => notFound;

  String plural(int count, [Map<String, dynamic>? args]) => notFound;

  String toGender([Gender? gender]) => notFound;

  String args(Map<String, dynamic> args) => notFound;
}
