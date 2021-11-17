import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';

void main() {
  testWidgets('it loads assets correctly', (_) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final data = await const NationsAssetsLoader().load(const Locale('ar'));
    expect(data != null, isTrue);
    expect(data?.isNotEmpty, isTrue);
    expect(data?['package_name'], 'أمم');
  });
}
