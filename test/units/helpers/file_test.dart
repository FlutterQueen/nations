import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/helpers/files.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final file = File('assets/lang.json');

  setUp(() async {
    if (file.existsSync()) file.deleteSync();
    file.createSync(recursive: true);
    file.writeAsStringSync('{"key":"value_ok"}');
  });

  tearDown(() {
    if (file.existsSync()) file.deleteSync();
  });
  group('loadJsonFileContent function ', () {
    testWidgets('it loads json file content ', (tester) async {
      expect(
        await loadJsonFileContent('assets/lang.json'),
        {'key': 'value_ok'},
      );
    });
  });
}
