import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

void main() {
  testWidgets('it loads assets correctly', (_) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final data = await const AppAssetsLoader().load(const Locale('ar'));
    expect(data.isNotEmpty, isTrue);
    expect(data['yes'], 'نعم');
  });
}
