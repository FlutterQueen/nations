import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/extract/base.dart';

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => ExtractedData.parse(this).toString();

  /// * translate a text **AND** use the default gender
  String get gender => ExtractedData.parse(this).toGender();

  /// * translate a text **AND** use the `male` gender
  String get trMale => ExtractedData.parse(this).toGender(Gender.male);

  /// * translate a text **AND** use the `female` gender
  String get trFemale => ExtractedData.parse(this).toGender(Gender.female);

  /// * translate a text and replace the args with provided data
  String args(Map<String, String> args) => ExtractedData.parse(this).args(args);

  ///  * translate a text and set the right word base on the provided count
  String plural(
    int count, [
    Map<String, String> args = const {},
  ]) =>
      ExtractedData.parse(this).plural(count, args);

  String toLocale([Locale? locale]) =>
      numberToLocale(this, Nations.config.fallbackLocale);
}
