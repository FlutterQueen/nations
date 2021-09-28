import 'package:flutter/material.dart';

import 'package:nations/nations.dart';

void main() {
  // TODO :: (1)
  // call the config method
  Nations.config();
  // TODO :: (2)
  // wrap your `MaterialApp` with NationsRoot
  runApp(const NationsRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _updateLocale() {
      // TODO ::(5) update the locale
      Nations.locale = Locale(
        Nations.locale.languageCode == 'ar' ? 'en' : 'ar',
      );
    }

    return MaterialApp(
      title: 'Flutter Demo',
      // TODO :: (3) pass these paramters
      locale: Nations.locale,
      localizationsDelegates: Nations.delegates,
      supportedLocales: Nations.supportedLocales,

      /// end ot Nations params
      home: Scaffold(
        appBar: AppBar(title: const Text('امم  Nations')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(Nations.locale.toString()),
              // TODO ::(4) translate
              Text('basmala'.tr),
              Text('package_name'.tr),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _updateLocale,
          child: const Icon(Icons.translate),
        ),
      ),
    );
  }
}
