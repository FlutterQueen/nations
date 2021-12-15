import 'package:flutter/material.dart';
import 'package:nations_assets/nations_assets.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class NationsAssetsLoader extends NationsLoader {
  /// * to load lang files from 'assets/lang/'
  const NationsAssetsLoader() : super('app');

  @override
  Map<String, dynamic> load(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return arAssets;
      case 'en':
        return enAssets;
      case 'es':
        return esAssets;
      default:
        return {};
    }
  }
}
