import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

typedef NotFoundBuilder = String Function(String key);

class NationsConfig {
  NationsConfig({
    this.baseLoader = const AppAssetsLoader(),
    this.fallbackLocale = const Locale('ar'),
    this.supportedLocales = const [
      Locale('ar'),
      Locale('en'),
    ],
    List<NationsLoader> loaders = const <NationsLoader>[
      AppAssetsLoader(),
    ],
    this.defaultGender = Gender.male,
    NotFoundBuilder? notFoundBuilder,
  })  : _notFoundBuilder = notFoundBuilder,
        _loaders = loaders;

  List<NationsLoader> get loaders => _loaders;

  /// which locale to use in case of failure
  final Locale fallbackLocale;
  final NationsLoader baseLoader;

  /// list of the supported locales
  final List<Locale> supportedLocales;

  /// the loaders
  final List<NationsLoader> _loaders;

  /// not found builder
  final String Function(String key)? _notFoundBuilder;

  NotFoundBuilder get notFoundBuilder => _notFoundBuilder ?? (_) => 'null';

  /// the default gender
  final Gender defaultGender;
}
