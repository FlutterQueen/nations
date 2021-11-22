part of 'base.dart';

class MapData extends ExtractedData<Map<String, dynamic>> {
  MapData(String key, Map<String, dynamic> value)
      : super(key: key, data: value);
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
    return notFound;
  }

  @override
  String plural(int count, [Map<String, dynamic>? args]) {
    if (data.isNotEmpty) {
      final pluralKey = resolveCount(count, data.keys);
      if (pluralKey != null && data[pluralKey] != null) {
        return replaceArgsOf(
          data[pluralKey],
          {
            'count': count.toString(),
            if (args != null) ...args,
          },
        );
      }
    }
    return notFound;
  }

  @override
  String args(Map<String, dynamic> args) => notFound;

  @override
  String toString() => notFound;
}