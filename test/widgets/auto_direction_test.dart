import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await (await SharedPreferences.getInstance()).clear();
    await Nations.boot();
  });

  testWidgets(
    'it build in rtl or ltr based on the locale',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());
      await tester.pumpAndSettle();

      expect(Nations.locale, equals(const Locale('ar')));

      /// *  Create the Finders.
      final rtlTextFinder = find.text('RTL');
      expect(Nations.locale.isRTL, isTrue);
      expect(Nations.locale.isLTR, isFalse);
      expect(Nations.locale.direction, equals(TextDirection.rtl));
      expect(rtlTextFinder, equals(findsOneWidget));

      await Nations.updateLocale(const Locale('en'));
      await tester.pumpAndSettle();
      final ltrTextFinder = find.text('LTR');
      expect(Nations.locale.isRTL, isFalse);
      expect(Nations.locale.isLTR, isTrue);
      expect(Nations.locale.direction, equals(TextDirection.ltr));
      expect(ltrTextFinder, equals(findsOneWidget));
    },
  );
}
