import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

void main() {
  test('it capitalize first word with single word', () {
    const str = "abcd";
    final result = capitalizeFirstChar(str);
    expect(result, equals("Abcd"));
  });
  test('it capitalize first word with more than one word', () {
    const str = "abcd efgh";
    final result = capitalizeFirstChar(str);
    expect(result, equals("Abcd efgh"));
  });
  test('it capitalize first word with more than one line', () {
    const str = '''abcd efgh
    queen nations''';
    final result = capitalizeFirstChar(str);
    expect(result, equals('''Abcd efgh
    queen nations'''));
  });

  test('it capitalize each word in a single line', () {
    const str = "abcd efgh jkl";
    final result = capitalizeEachWord(str);
    expect(result, equals("Abcd Efgh Jkl"));
  });

  test('it capitalize each word in more than one line', () {
    const str = '''abcd efgh
    queen nations
    foo bar z-ee
    ''';
    final result = capitalizeEachWord(str);
    expect(result, equals('''Abcd Efgh
    Queen Nations
    Foo Bar Z-ee
    '''));
  });
}
