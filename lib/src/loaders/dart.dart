import 'dart:async';
import 'dart:ui';

import '../../nations.dart';

class NationsDartLoader extends NationsLoader {
  FutureOr<Map<String, dynamic>> Function(Locale locale) loader;
  NationsDartLoader({
    required this.loader,
  });
  @override
  Future<Map<String, dynamic>> load(Locale locale) async => loader(locale);
}
