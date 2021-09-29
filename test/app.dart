import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/loaders.dart';

class NationsTestApp extends StatelessWidget {
  const NationsTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NationsRoot(
      child: MaterialApp(
        locale: Nations.locale,
        localizationsDelegates: Nations.delegates,
        supportedLocales: Nations.supportedLocales,
        home: const _FullScaffold(),
      ),
    );
  }
}

class _FullScaffold extends StatelessWidget {
  const _FullScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('package_name'.tr),
          Text('date'.tr),
          Text('time'.tr),
          Text('edit'.tr),
          Text('show'.tr),
          Text('delete'.tr),
          Text('no'.tr),
          Text('yes'.tr),
        ],
      ),
    );
  }
}

class TestFilesLoader extends NationsLoader {
  @override
  Future<Map<String, dynamic>> load(Locale locale) async {
    final file = File('assets/lang/$locale.json');
    return jsonDecode(file.readAsStringSync());
  }
}
