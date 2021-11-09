import 'package:flutter_test/flutter_test.dart';
import 'dart:ui' show window;

import 'package:nations/nations.dart';
import 'package:nations/src/delegate.dart';

void main() {
  test(
    'it return the Device Locale ',
    () => expect(Nations.deviceLocale, window.locale),
  );
  test(
    'it contains the NationsDelegate',
    () => expect(
        Nations.delegates, contains(isA<NationsLocalizationsDelegate>())),
  );
}
