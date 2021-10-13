import 'package:nations/nations.dart';

import '../enums.dart';
import '../translation_methods.dart' as h;

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => h.tr(this);

  /// * translate a text **AND** use the `male` gender
  String get trMale => h.gender(this, Gender.male);

  /// * translate a text **AND** use the `female` gender
  String get trFemale => h.gender(this, Gender.female);

  /// * translate a text **AND** use the default gender
  String get gender => h.gender(this);

  String args(Map<String, dynamic> attributes) {
    return h.trWithArgs(this, attributes);
  }
}
