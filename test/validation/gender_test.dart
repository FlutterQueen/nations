import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/helpers/validation.dart';

void main() {
  test(
    'it returns true if value is not a Map',
    () {
      // string
      expect(isValidGenderMap('iam a string 😀'), isFalse);
      // int
      expect(isValidGenderMap(1), isFalse);
      // lists
      expect(isValidGenderMap([]), isFalse);
      // sets
      expect(isValidGenderMap({1, 2, 3}), isFalse);
      // double
      expect(isValidGenderMap(1.1), isFalse);
    },
  );
  test(
    'it returns false if the map is empty',
    () => expect(isValidGenderMap({}), isFalse),
  );
  test('it return false if missing one gender either male of female', () {
    // female
    expect(isValidGenderMap({'male': 'foo'}), isFalse);
    // male
    expect(isValidGenderMap({'female': 'foo'}), isFalse);
  });

  test(
    'it return true if the map contains male and female',
    () {
      final withMaleAndFemale = isValidGenderMap({
        'male': 'male gender',
        'female': 'female gender',
      });
      expect(withMaleAndFemale, isTrue);
    },
  );
}
