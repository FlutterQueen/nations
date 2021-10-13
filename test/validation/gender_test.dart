import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/validation/gender.dart';

void main() {
  test('detect if the value is valid gender', () {
    final withString = isValidGenderMap('iam a string 😀');
    expect(withString, isFalse);
    final withEmptyMap = isValidGenderMap({});
    expect(withEmptyMap, isFalse);
    final withMapWithOnlyMale = isValidGenderMap({'male': 'male gender'});
    expect(withMapWithOnlyMale, isFalse);
    final withMaleAndFemale = isValidGenderMap({
      'male': 'male gender',
      'female': 'female gender',
    });
    expect(withMaleAndFemale, isTrue);
  });
}
