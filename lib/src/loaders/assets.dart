import 'package:nations/src/helpers/files.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class AppAssetsLoader extends NationsLoader {
  const AppAssetsLoader() : super('app');
  @override
  Future<Map<String, dynamic>> load(locale) async =>
      await loadLocaleTranslation(locale) ?? {};
}
