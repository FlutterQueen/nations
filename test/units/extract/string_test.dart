import 'package:flutter_test/flutter_test.dart';
import 'package:nations/src/extract/base.dart';

void main() {
  // setUp(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  // });
  test('it return the value ', () {
    final data = StringData('key', 'value');
    expect(data.toString(), 'value');
  });
  test('it return notFound for plural ', () {
    final data = StringData('key', 'value');
    expect(data.plural(1), 'null');
    expect(data.plural(2), 'null');
    expect(data.plural(3), 'null');
    expect(data.plural(4), 'null');
  });
  test('it return notFound for gender ', () {
    final data = StringData('key', 'value');
    expect(data.toGender(), 'null');
  });
}
