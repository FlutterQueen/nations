import 'dart:ui';

import 'dart:async';

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
