import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/extract/base.dart';

void main() {
  test('it return not found if gender does not exist', () {
    /// *
    final mapData = MapData('key', {'male': 'Man'});
    expect(mapData.toGender(Gender.male), null);
  });
  test('it will return not found when plural with empty map', () {
    final mapData = MapData('key', {});
    expect(mapData.plural(1), null);
  });
  test('support args within plural', () {
    final mapData = MapData('key', {'0': 'flutter :arg'});
    expect(mapData.plural(0, {'arg': 'queen'}), 'flutter queen');
  });
  test('it will return the default', () {
    final mapData = MapData('key', {'male': 'Man'});
    expect(mapData.text(), null);
    expect(mapData.args({}), null);
  });
  test('it will return the default', () {
    final mapData = MapData(
      'gender',
      {
        'this': 'الجنس',
        'male': 'ذكر',
        'female': 'انثي',
      },
    );
    expect(mapData.text(), 'الجنس');
  });
}
