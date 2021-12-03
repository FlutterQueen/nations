import 'dart:async';

import 'package:flutter/material.dart';

/// * loads translation form assets or any source
/// * extend it to build you custom loader if none of the existing
/// * fits your needs
abstract class NationsLoader {
  const NationsLoader(this.name);

  final String name;

  ///* loads the data from you files
  FutureOr<Map<String, Object?>> load(Locale locale);
}

class FooLoader extends NationsLoader {
  const FooLoader() : super('foo');

  @override
  FutureOr<Map<String, Object?>> load(Locale locale) async {
    return {
      'foo': 'bar',
    };
  }
}
