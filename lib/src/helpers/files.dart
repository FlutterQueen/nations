import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadPackageFileContent(Locale locale) async {
  final jString = await rootBundle.loadString(
    'packages/nations/assets/lang/$locale.json',
  );
  final jsonMap = json.decode(jString);
  return jsonMap;
}

Future<Map<String, dynamic>> loadJsonFileContent(Locale locale) async {
  final jString = await rootBundle.loadString('lang/$locale.json');
  final jsonMap = json.decode(jString);
  return jsonMap;
}
