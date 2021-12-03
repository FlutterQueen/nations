part of 'base.dart';

/// to handle String values conversion
class StringData extends ExtractedData<String> {
  /// to handle String values conversion
  StringData(
    String key,
    String value,
  ) : super(key: key, data: value);

  @override
  String args(Map<String, dynamic> args) => replaceArgsOf(data, args);

  @override
  String toString() => data;

  @override
  String plural(int count, [Map<String, dynamic>? args]) => notFound;

  @override
  String toGender([Gender? gender]) => notFound;
}
