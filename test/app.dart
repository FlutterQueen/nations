import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/loaders.dart';

class NationsTestApp extends StatelessWidget {
  const NationsTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp();

    return const NationsRoot(
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Nations.locale,
      localizationsDelegates: Nations.delegates,
      supportedLocales: Nations.supportedLocales,
      // builder: ,
      home: const _MyWidget(),
    );
  }
}

class _MyWidget extends StatelessWidget {
  const _MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('Foo'),
          Text(Nations.isRTL ? 'RTL' : 'LTR'),
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
