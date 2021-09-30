import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

import 'app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Nations.config(
      loader: TestFilesLoader(),
      // fallbackLocale: const Locale('ar'),
    );
    Nations.load(Nations.locale);
  });
  testWidgets(
    'find widget',
    (WidgetTester tester) async {
      await tester.pumpWidget(const NationsTestApp());

      /// *  Create the Finders.
      final nullTextFinder = find.widgetWithText(Text, 'Foo');
      expect(nullTextFinder, equals(findsOneWidget));
    },
  );
  testWidgets(
    'it rebuilds after the locale changes',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());

      expect(Nations.locale, equals(const Locale('ar')));
      log(Nations.translations.toString());

      /// *  Create the Finders.
      final nullTextFinder = find.text('null');
      expect(nullTextFinder, equals(findsNothing));

      final dateFinder = find.text('التاريخ');
      final timeFinder = find.text('الوقت');
      expect(dateFinder, equals(findsOneWidget));
      expect(timeFinder, equals(findsOneWidget));
    },
  );
  testWidgets(
    'it build in rtl or ltr based on the locale',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());

      expect(Nations.locale, equals(const Locale('ar')));

      /// *  Create the Finders.
      final rtlTextFinder = find.text('RTL');
      expect(Nations.isRTL, isTrue);
      expect(rtlTextFinder, equals(findsOneWidget));
      Nations.locale = const Locale('en');
      final ltrTextFinder = find.text('LTR');
      expect(Nations.isLTR, isTrue);
      expect(ltrTextFinder, equals(findsOneWidget));
    },
  );
}
