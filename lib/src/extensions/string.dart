import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/extract/base.dart';

/// string translation extension
extension NationsTrans on String {
  /// * translate a text based on the App locale
  /// * if there is error will use the config `notFound`
  String get tr =>
      ExtractedData.parse(this).text() ?? Nations.config.notFound(this);

  /// * translate a text **AND** use the default gender
  /// * if there is error will use the config `notFoundGender`
  String get gender =>
      ExtractedData.parse(this).toGender() ??
      Nations.config.notFoundGender(this);

  /// * translate a text **AND** use the `male` gender
  /// * if there is error will use the config `notFoundGender`
  String get trMale =>
      ExtractedData.parse(this).toGender(Gender.male) ??
      Nations.config.notFoundGender(this, Gender.male);

  /// * translate a text **AND** use the `female` gender
  /// * if there is error will use the config `notFoundGender`
  String get trFemale =>
      ExtractedData.parse(this).toGender(Gender.female) ??
      Nations.config.notFoundGender(this, Gender.female);

  /// * translate a text and replace the args with provided data
  /// * if there is error will use the config `notFoundArgs`
  String args(Map<String, Object> args) =>
      ExtractedData.parse(this).args(args) ??
      Nations.config.notFoundArgs(this, args);

  ///  * translate a text and set the right word base on the provided count
  /// * if there is error will use the config `notFoundPlural`
  String plural(
    int count, [
    Map<String, Object> args = const {},
  ]) =>
      ExtractedData.parse(this).plural(count, args) ??
      Nations.config.notFoundPlural(this, count, args);

  /// covert the number to locale format
  /// if none locale givin it will use the fallback from the config
  String toLocale([Locale? locale]) =>
      numberToLocale(this, locale ?? Nations.config.fallbackLocale);
}
