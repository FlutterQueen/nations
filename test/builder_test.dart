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
      fallbackLocale: const Locale('ar'),
    );
  });
  testWidgets(
    'it rebuilds after the locale changes',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const NationsTestApp());

      expect(Nations.locale, equals(const Locale('ar')));
      print(Nations.translations.values);
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
}
