import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('it loads saved locale form prefs if exist', () async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('queen.nations.lang', 'ar');
    await Nations.boot();
    final current = Nations.locale;
    expect(current, const Locale('ar'));
  });
}
