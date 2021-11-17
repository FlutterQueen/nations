import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

typedef NotFoundBuilder = String Function(String key);

class NationsConfig {
  NationsConfig({
    this.fallbackLocale = const Locale('ar'),
    this.supportedLocales = const [
      Locale('ar'),
      Locale('en'),
    ],
    this.loader = const NationsAssetsLoader(),
    this.defaultGender = Gender.male,
    NotFoundBuilder? notFoundBuilder,
  }) : _notFoundBuilder = notFoundBuilder;

  /// which locale to use in case of failure
  final Locale fallbackLocale;

  /// list of the supported locales
  final List<Locale> supportedLocales;

  /// the loader
  final NationsLoader loader;

  /// not found builder
  final String Function(String key)? _notFoundBuilder;

  NotFoundBuilder get notFoundBuilder => _notFoundBuilder ?? (_) => 'null';

  /// the default gender
  final Gender defaultGender;
}
