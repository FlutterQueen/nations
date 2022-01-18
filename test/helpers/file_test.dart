import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/helpers/files.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('loadJsonFileContent function ', () {
    testWidgets('it loads json file content ', (tester) async {
      expect(
        await loadJsonFileContent('assets/lang.json'),
        {'key': 'value_ok'},
      );
    });
  });
}
