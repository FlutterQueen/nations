import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

import 'app.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Nations.setConfig(NationsTestConfig());
  });

  testWidgets(
    'it rebuilds after the locale changes',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());
      await tester.pumpAndSettle();

      expect(Nations.locale, equals(const Locale('ar')));

      /// *  Create the Finders.
      final nullTextFinder = find.text('null');
      expect(nullTextFinder, equals(findsNothing));

      final dateArFinder = find.text('التاريخ');
      final timeArFinder = find.text('الوقت');
      expect(dateArFinder, findsOneWidget);
      expect(timeArFinder, findsOneWidget);

      Nations.locale = const Locale('en');

      await tester.pumpAndSettle();
      expect(Nations.locale, equals(const Locale('en')));

      final dateEnFinder = find.text('date');
      final timeEnFinder = find.text('time');
      expect(dateEnFinder, findsOneWidget);
      expect(timeEnFinder, findsOneWidget);
    },
  );
}
