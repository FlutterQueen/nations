import 'dart:async';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

class CustomLoader extends NationsLoader {
  const CustomLoader() : super('test');
  @override
  String get name => 'custom';
  @override
  FutureOr<Map<String, dynamic>> load(Locale locale) => {};
}

void main() {
  const loader = CustomLoader();
  group('base loader', () {
    test('it loads nation assets correctly', () async {
      final assets = await loader.load(const Locale('ar'));
      expect(assets, isNotNull);
      expect(assets.isNotEmpty, isTrue);
    });
  });
}
