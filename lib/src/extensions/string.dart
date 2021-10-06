import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

import '../enums.dart';
import '../translation_methods.dart' as h;

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => h.tr(this);

  String get trMale => h.gender(this, Gender.male);
  String get trFemale => h.gender(this, Gender.female);
  String get gender => h.gender(this);

  // h.tr(this);
}
