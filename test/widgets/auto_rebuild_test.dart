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
    'it rebuilds after the locale changes',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());
      // await tester.pumpAndSettle();

      expect(Nations.locale, equals(const Locale('ar')));

      /// *  Create the Finders.
      final nullTextFinder = find.text('null');
      expect(nullTextFinder, equals(findsNothing));

      final dateArFinder = find.text('التاريخ');
      expect(dateArFinder, findsOneWidget);

      final timeArFinder = find.text('الوقت');
      expect(timeArFinder, findsOneWidget);

      await Nations.updateLocale(const Locale('en'));

      await tester.pumpAndSettle();

      expect(Nations.locale, equals(const Locale('en')));

      final dateEnFinder = find.text('date');
      expect(dateEnFinder, findsOneWidget);

      final timeEnFinder = find.text('time');
      expect(timeEnFinder, findsOneWidget);
    },
  );
}
