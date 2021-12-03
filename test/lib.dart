import 'dart:async';
import 'dart:ui';

import 'package:nations/nations.dart';

class NationsTestLoader extends NationsLoader {
  final Map<String, Object>? data;
  NationsTestLoader([String name = 'test', this.data]) : super(name);

  @override
  FutureOr<Map<String, Object?>> load(Locale locale) {
    return data ??
        {
          'test_k': 'test_v',
        };
  }
}
