import 'enums.dart';
import 'extractors/data.dart';

String tr(String key) => ExtractedData.from(key).toString();

///
String trMale(String key) => ExtractedData.from(key).toGender(Gender.male);

String trFemale(String key) => ExtractedData.from(key).toGender(Gender.female);

String trWithArgs(
  String key,
  Map<String, dynamic> attributes,
) =>
    ExtractedData.from(key).args(attributes);

String trPlural(
  String key,
  int count, [
  Map<String, dynamic>? attributes,
]) =>
    ExtractedData.from(key).plural(count, attributes);

String gender(
  String key, [
  Gender? gender,
]) =>
    ExtractedData.from(key).toGender(gender);
