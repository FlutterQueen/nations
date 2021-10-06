import 'package:flutter/material.dart';
import 'package:nations/src/enums.dart';

import '../loaders/base.dart';
import '../loaders/json.dart';

class NationsConfig {
  NationsConfig({
    this.fallbackLocale = const Locale('ar'),
    this.supportedLocales = const [
      Locale('ar'),
      Locale('en'),
    ],
    this.loader = const NationsJsonLoader(),
    this.defaultGender = Gender.male,
    String Function(String key)? notFoundBuilder,
  }) : _notFoundBuilder = notFoundBuilder;

  final Locale fallbackLocale;
  final List<Locale> supportedLocales;

  final NationsLoader loader;

  final String Function(String key)? _notFoundBuilder;
  String Function(String key) get notFoundBuilder =>
      _notFoundBuilder ?? (String key) => 'null';

  final Gender defaultGender;
}
