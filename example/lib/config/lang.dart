import 'dart:ui';

import 'package:nations/nations.dart';

class AppLangConfig extends NationsConfig {
  @override
  Gender get defaultGender => Gender.female;

  @override
  List<NationsLoader> get loaders => [
        /// TODO :: add packages loaders
      ];

  @override
  String notFound(String key) => 'null';

  @override
  List<Locale> get supportedLocales => const <Locale>[
        Locale('ar'),
        Locale('en'),
      ];
}
