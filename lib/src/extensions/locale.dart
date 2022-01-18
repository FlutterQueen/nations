import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

///
extension NationsLocaleX on Locale {
  /// return true if this app support this locale
  bool get isSupported => Nations.config.supportedLocales.contains(this);
}
