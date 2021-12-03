import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// builds the message if key does not exist or used in bad way
typedef NotFoundBuilder = String Function(String key);

/// contains the localization config
class NationsConfig {
  /// coning base class
  NationsConfig({
    this.baseLoader = const AppAssetsLoader(),
    List<NationsLoader> loaders = const <NationsLoader>[
      AppAssetsLoader(),
    ],
    String Function(String key)? notFoundBuilder,
  })  : _notFoundBuilder = notFoundBuilder,
        _loaders = loaders;

  /// registered loaders list
  List<NationsLoader> get loaders => _loaders;

  /// which locale to use in case of failure
  Locale get fallbackLocale => const Locale('ar');

  /// loads the app translations
  final NationsLoader baseLoader;

  /// list of the supported locales
  List<Locale> get supportedLocales => const [
        Locale('ar'),
        Locale('en'),
      ];

  /// the loaders
  final List<NationsLoader> _loaders;

  /// not found builder
  final String Function(String key)? _notFoundBuilder;

  /// to build the not found string
  String Function(String key) get notFoundBuilder =>
      _notFoundBuilder ?? (_) => 'null';

  /// the default gender
  Gender get defaultGender => Gender.male;
}
