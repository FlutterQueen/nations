import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../nations.dart';

class TestFilesLoader extends NationsLoader {
  @override
  Future<Map<String, dynamic>> load(Locale locale) async {
    final file = File('assets/lang/$locale.json');
    return jsonDecode(file.readAsStringSync());
  }
}
