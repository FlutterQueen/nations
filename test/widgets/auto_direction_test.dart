import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

import '../app.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Nations.setConfig(NationsTestConfig());
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
      expect(Nations.isRTL, isTrue);
      expect(Nations.isLTR, isFalse);
      expect(Nations.direction, equals(TextDirection.rtl));
      expect(rtlTextFinder, equals(findsOneWidget));

      Nations.locale = const Locale('en');
      await tester.pumpAndSettle();
      final ltrTextFinder = find.text('LTR');
      expect(Nations.isRTL, isFalse);
      expect(Nations.isLTR, isTrue);
      expect(Nations.direction, equals(TextDirection.ltr));
      expect(ltrTextFinder, equals(findsOneWidget));
    },
  );
}
