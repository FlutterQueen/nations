import 'package:flutter/material.dart';
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
    final result = capitalizeFirstCharForEachWord(str);
    expect(result, equals("Abcd Efgh Jkl"));
  });

  test('it capitalize each word in more than one line', () {
    const str = '''abcd efgh
    queen nations
    foo bar z-ee
    ''';
    final result = capitalizeFirstCharForEachWord(str);
    expect(result, equals('''Abcd Efgh
    Queen Nations
    Foo Bar Z-ee
    '''));
  });

  group('numberToLocale function', () {
    test('it return the original String if the value is empty', () {
      final result = numberToLocale('');
      expect(result.length, equals(0));
    });
    test('it uses the fallback locale if non provided', () {
      final result = numberToLocale('٠١٢٣٤٥٦٧٨٩');
      expect(result, equals('0123456789'));
    });
    test('it can convert between symbols and spaces', () {
      final result = numberToLocale(
          '0A1B2_3#4@5  6  H7   ______ 8!!!!!!!!!!!!....9...',
          const Locale('hi'));
      expect(
          result, equals('٠A١B٢_٣#٤@٥  ٦  H٧   ______ ٨!!!!!!!!!!!!....٩...'));
    });
    test('it convert numbers to arabic', () {
      final source = numberToLocale('٠١٢٣٤٥٦٧٨٩', const Locale('ar'));
      expect(source.length, equals('0123456789'));
    });
    test('it convert numbers to hindi', () {
      final source = numberToLocale('123456789', const Locale('hi'));
      expect(source.length, equals('٠١٢٣٤٥٦٧٨٩'));
    });
  });
}
