import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../lib.dart';
import 'test_config.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('it loads saved locale form prefs if exist', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('queen.nations.lang', 'ar');
    await Nations.boot(NationsTestConfig());
    final current = Nations.locale;
    expect(current, const Locale('ar'));
  });

  group('load method', () {
    test('it always load the nations assets', () async {
      await Nations.load(const Locale('en'));
      expect(Nations.translations.containsKey('gender'), isTrue);
    });
    test('it loads all the loaders and add them by loader name', () async {
      await Nations.boot(
        NationsConfig(
          loaders: [
            NationsTestLoader('test_1'),
            NationsTestLoader('test_2'),
            NationsTestLoader('test_3'),
            NationsTestLoader('test_4'),
            NationsTestLoader('test_5'),
          ],
        ),
      );

      expect('test_1.test_k'.tr, 'test_v');
      expect('test_2.test_k'.tr, 'test_v');
      expect('test_3.test_k'.tr, 'test_v');
      expect('test_4.test_k'.tr, 'test_v');
      expect('test_5.test_k'.tr, 'test_v');
    });
    test('it can override any value on any loader', () async {
      await Nations.boot(
        NationsConfig(
          loaders: [
            NationsTestLoader('test_package', {'foo_key': 'test_1'}),
          ],
          baseLoader: NationsTestLoader(
            'this name does not matter',
            {
              'test_package': {'foo_key': 'overridden_data'}
            },
          ),
        ),
      );

      expect('test_package.foo_key'.tr, 'overridden_data');
    });
    test('it will note deletes data when it override any value on any loader',
        () async {
      await Nations.boot(
        NationsConfig(
          loaders: [
            NationsTestLoader('test_package', {
              'foo_key': 'test_1',
              'bar_key': 'bar_value',
            }),
          ],
          baseLoader: NationsTestLoader(
            'this name does not matter',
            {
              'test_package': {'foo_key': 'overridden_data'}
            },
          ),
        ),
      );

      expect('test_package.foo_key'.tr, 'overridden_data');
      expect('test_package.bar_key'.tr, 'bar_value');
    });
  });
}
