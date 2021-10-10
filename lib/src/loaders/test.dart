import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../nations.dart';

/// this loader is meant for test purposes only
/// since we cant load assets with the rootBundle from the tests
class TestFilesLoader extends NationsLoader {
  @override
  Future<Map<String, dynamic>> load(Locale locale) async {
    final file = File('assets/lang/$locale.json');
    return jsonDecode(file.readAsStringSync());
  }
}
