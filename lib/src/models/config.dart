import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// contains the localization config
class NationsConfig {
  /// coning base class
  NationsConfig({
    this.baseLoader = const AppAssetsLoader(),
    this.loaders = const <NationsLoader>[AppAssetsLoader()],
  });

  /// which locale to use in case of failure
  Locale get fallbackLocale => const Locale('ar');

  /// loads the app translations
  final NationsLoader baseLoader;

  /// list of the supported locales
  List<Locale> get supportedLocales => const [
        Locale('ar'),
        Locale('en'),
        Locale('es'),
      ];

  /// the default gender
  Gender get defaultGender => Gender.male;

  /// the loaders
  final List<NationsLoader> loaders;

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
}
