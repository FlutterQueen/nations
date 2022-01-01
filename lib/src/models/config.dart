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
  }) : _loaders = loaders;

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
  /// to build the not found string
  String notFound(String key) => 'null';

  /// not found builder
  /// to build the not found string
  String notFoundPlural(
    String key,
    int count,
    Map<String, Object> args,
  ) =>
      notFound(key);

  /// not found builder
  /// to build the not found string
  String notFoundArgs(
    String key,
    Map<String, Object> args,
  ) =>
      notFound(key);

  /// not found builder
  /// to build the not found string
  String notFoundGender(
    String key, [
    Gender? gender,
  ]) =>
      notFound(key);

  /// the default gender
  Gender get defaultGender => Gender.male;
}
