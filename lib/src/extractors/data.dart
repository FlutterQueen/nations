import 'dart:developer';
import 'package:nations/nations.dart';
import '../enums.dart';
import '../typedef.dart';
import '../validation.dart';
part 'helpers.dart';

class ExtractedData {
  final String key;
  final dynamic data;

  ExtractedData({
    required this.key,
    required this.data,
  });
  factory ExtractedData.from(String key) {
    final fromValues = _transFromMap(key, Nations.translations);
    if (fromValues != null) return ExtractedData(key: key, data: fromValues);
    log('cant get from the your Assets or nation will return null then !');
    return ExtractedData(key: key, data: null);
  }
  @override
  String toString() {
    if (isValidStringValue(data)) return data;
    log('extraction is not done correctly you have to use the right extractor function');
    return Nations.config.notFoundBuilder(key);
  }

  String toGender(Gender? gender) {
    if (isValidGenderMap(data)) {
      switch (gender) {
        case null:
          return toGender(Nations.defaultGender);
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

  String args(Args args) => replaceArgsOf(data, args);

  String plural(int count, [Args? args]) {
    if (isValidArgs(data)) {
      final pluralKey = resolveCount(
            count,
            (data as Args).keys.toList(),
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
