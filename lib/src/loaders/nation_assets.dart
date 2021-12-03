import 'package:flutter/material.dart';
import 'package:nations/src/helpers/files.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class NationsAssetsLoader extends NationsLoader {
  /// * to load lang files from 'assets/lang/'
  const NationsAssetsLoader() : super('app');

  @override
  String get name => 'nations';
  @override
  Future<Map<String, dynamic>> load(Locale locale) async =>
      (await loadPackageTranslation(locale: locale, packageName: name))!;
}
