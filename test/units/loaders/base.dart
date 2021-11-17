import 'dart:ui';

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

class CustomLoader extends NationsLoader {
  @override
  FutureOr<Map<String, dynamic>?> load(Locale locale) => null;
}

void main() {
  final loader = CustomLoader();
  group('base loader', () {
    test('it loads nation assets correctly', () async {
      final assets = await loader.loadWithNationValues(const Locale('ar'));
      expect(assets, isNotNull);
      expect(assets.isNotEmpty, isTrue);
    });
  });
}
