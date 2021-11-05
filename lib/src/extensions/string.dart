import 'package:nations/nations.dart';
import 'package:nations/src/typedef.dart';

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

  /// * translate a text and replace the args with provided data

  String args(Args args) => h.trWithArgs(this, args);

  ///  * translate a text and set the right word base on the provided count
  String plural(int count, [Args? args]) => h.trPlural(this, count, args);
}
