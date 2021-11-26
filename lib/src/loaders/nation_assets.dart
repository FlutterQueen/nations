import 'package:nations/src/helpers/files.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class NationsAssetsLoader extends NationsLoader {
  const NationsAssetsLoader() : super('app');

  @override
  String get name => 'nations';
  @override
  Future<Map<String, dynamic>> load(locale) async =>
      (await loadPackageTranslation(locale: locale, packageName: name))!;
}
