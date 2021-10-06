/// Let the people use there languages 💪
library nations;

import 'package:nations/src/controller.dart';

/// * extensions
export 'src/extensions/nations_base.dart';
export 'src/extensions/string.dart';

/// * helpers
export 'src/helpers/string.dart';
export 'src/helpers/locales.dart';
export 'src/helpers/string.dart';

/// * loaders
export 'src/loaders/base.dart';
export 'src/loaders/json.dart';
export 'src/loaders/test.dart';

/// * widgets
export 'src/widgets/builder.dart';

export 'src/translation_methods.dart';
export 'src/controller.dart';

/// * config
export 'src/models/config.dart';

/// * enums
export 'src/enums.dart';

// * # Global object to handle the localizations actions
// ignore: non_constant_identifier_names
final Nations = NationsBase();
