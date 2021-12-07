import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

import '../test_config.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Nations.boot(NationsTestConfig());
  });

  group('not found tests', () {
    test('it return the not found def value if is null', () {
      expect('fooBarZee'.tr, equals('null'));
    });
    test('it return the not found def value if the plural value does not exist',
        () {
      expect('fooBarZee'.plural(50), equals('null'));
    });
    test('it return not found def value if the parent exist and the child not',
        () {
      expect('gender.bar'.tr, equals('null'));
    });
  });
  test('it translate simple key', () {
    expect('yes'.tr, equals('نعم'));
  });

  group('gender extension', () {
    test('it translate to male Gender', () {
      expect('gender'.trMale, equals('ذكر'));
    });
    test('it translate to female Gender', () {
      expect('gender'.trFemale, equals('انثي'));
    });
    test('it translate to the default Gender', () {
      expect('gender'.gender, equals('ذكر'));
    });
  });
  test('it translate and replace Args', () {
    expect('test.args_key'.args({'name': 'احمد'}), equals('اهلا بك يا احمد'));
  });
  test('it convert the the number to locale based number', () {
    expect('٠١٢٣٤٥٦٧٨٩'.toLocale(const Locale('ar')), '0123456789');
  });

  group('pluralization', () {
    test('it support pluralization', () {
      expect('test.apples'.plural(1), equals('تفاحه واحده'));
      expect('test.apples'.plural(2), equals('تفاحتين'));
      expect('test.apples'.plural(5), equals('خمسه تفاحات'));
      expect('test.apples'.plural(10), equals('عشرة تفاحات'));
      expect('test.apples'.plural(14), equals('14 تفاحه'));
      expect('test.apples'.plural(15), equals('15 تفاحه'));
      expect('test.apples'.plural(65), equals('من ستون الي سبعون'));
    });
  });
}
