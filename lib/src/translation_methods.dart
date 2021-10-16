import 'enums.dart';
import 'extractors/data.dart';

String tr(String key) {
  return ExtractedData.from(key).toString();
}

///
String trMale(String key) {
  return ExtractedData.from(key).toGender(Gender.male);
}

String trFemale(String key) {
  return ExtractedData.from(key).toGender(Gender.female);
}

String trWithArgs(String key, Map<String, dynamic> attributes) {
  return ExtractedData.from(key).args(attributes);
}

String trPlural(String key, int count, [Map<String, dynamic>? attributes]) {
  return ExtractedData.from(key).plural(count, attributes);
}

String gender(String key, [Gender? gender]) {
  final data = ExtractedData.from(key);
  return data.toGender(gender);
}
