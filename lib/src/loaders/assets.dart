import 'package:nations/src/helpers/files.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class NationsAssetsLoader extends NationsLoader {
  const NationsAssetsLoader();
  @override
  Future<Map<String, dynamic>?> load(locale) => loadLocaleTranslation(locale);
}
