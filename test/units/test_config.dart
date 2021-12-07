import 'package:nations/nations.dart';

import '../lib.dart';

class NationsTestConfig extends NationsConfig {
  @override
  List<NationsLoader> get loaders => [NationsTestLoader()];
}
