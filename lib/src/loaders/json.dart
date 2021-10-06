import 'package:nations/src/helpers/files.dart';

import '../../nations.dart';
import 'base.dart';

/// * to load lang files from 'assets/lang/'
class NationsJsonLoader extends NationsLoader {
  const NationsJsonLoader();
  @override
  Future<Map<String, dynamic>> load(locale) => loadJsonFileContent(locale);

  @override
  String toString() => 'NationsJsonLoader';
}
