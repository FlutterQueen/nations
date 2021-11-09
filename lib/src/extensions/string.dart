import 'package:nations/nations.dart';

import '../extractors.dart';

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => ExtractedData.from(this).toString();

  /// * translate a text **AND** use the `male` gender
  String get trMale => ExtractedData.from(this).toGender(Gender.male);

  /// * translate a text **AND** use the `female` gender
  String get trFemale => ExtractedData.from(this).toGender(Gender.female);

  /// * translate a text **AND** use the default gender
  String get gender => ExtractedData.from(this).toGender();

  /// * translate a text and replace the args with provided data
  String args(Map<String, dynamic> args) => ExtractedData.from(this).args(args);

  ///  * translate a text and set the right word base on the provided count
  String plural(int count, [Map<String, dynamic>? args]) =>
      ExtractedData.from(this).plural(count, args);
}
