import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

void main() {
  const _rtlLocales = <Locale>[
    Locale('ar'), // Arabic
    Locale('fa'), // Farsi
    Locale('he'), // Hebrew
    Locale('ps'), // Pashto
    Locale('ur'), // Urdu
  ];

  group('isRtl Locale extension', () {
    test('it convert languageCode lowerCase', () {
      expect(const Locale('AR').isRTL, isTrue);
    });
    test('it uses only the languageCode', () {
      expect(const Locale('ar', 'EG').isRTL, isTrue);
      expect(const Locale('en', 'US').isRTL, isFalse);
    });
    test('it return True if the the locale is RTL', () {
      for (final locale in _rtlLocales) {
        expect(locale.isRTL, isTrue);
      }
    });
    test('it should Return false if the locale is not RTL', () {
      for (final locale in _rtlLocales) {
        expect(locale.isLTR, isFalse);
      }
    });
  });
  group('isLtr Locale extension', () {
    test('use languageCode lowerCase', () {
      expect(const Locale('EN').isLTR, isTrue);
    });
    test('it should return false if the the locale is RTL', () {
      for (final locale in _rtlLocales) {
        expect(locale.isLTR, isFalse);
      }
    });
    test('it should return true if the locale is LTR', () {
      for (final locale in ['fr', 'en', 'ru']) {
        expect(Locale(locale).isLTR, isTrue);
      }
    });
  });

  group('direction Locale extension', () {
    test('use languageCode lowerCase', () {
      expect(const Locale('AR').direction, TextDirection.rtl);
    });
    test('it should return `TextDirection.rtl` if the the locale is RTL', () {
      for (final locale in _rtlLocales) {
        expect(locale.direction, TextDirection.rtl);
      }
    });
    test('it should return `TextDirection.ltr` if the locale is LTR', () {
      for (final locale in ['fr', 'en', 'ru']) {
        expect(Locale(locale).direction, TextDirection.ltr);
      }
    });
  });
}
