import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/extract/base.dart';

void main() {
  // setUp(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  // });
  test('it always return not found', () {
    final data = NotFoundData('key');
    expect(data.text(), null);
    expect(data.args({}), null);
    expect(data.plural(1), null);
    expect(data.toGender(), null);
  });
}
