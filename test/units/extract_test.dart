import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/extract/base.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Nations.load(const Locale('ar'));
  });
  test('it return null if key does not exist', () {
    final data = ExtractedData.parse('null_key');
    expect(data, isA<NotFoundData>());
  });
  test('if key ends with . it wont matter', () {
    final data = ExtractedData.parse('foo.');
    expect(data, isA<NotFoundData>());
  });
  test('return NotFoundData if the key type is not supported', () {
    final data = ExtractedData.parse('bar');
    expect(data, isA<NotFoundData>());
  });
}
