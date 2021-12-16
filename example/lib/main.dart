import 'package:flutter/material.dart';

import 'package:nations/nations.dart';

import 'page2.dart';

Future<void> main() async {
  // TODO :: (2)
  await Nations.boot();
  runApp(
    NationsBuilder(builder: (ctx) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // TODO :: (3) pass these parameters
      locale: Nations.locale,
      localizationsDelegates: Nations.delegates,
      supportedLocales: Nations.supportedLocales,
      builder: (context, child) => child!,

      /// end ot Nations params
      home: const MySc(),
    );
  }
}

class MySc extends StatelessWidget {
  const MySc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _updateLocale() {
      //  TODO ::(5) update the locale
      // Nations.updateLocale(Locale(
      //   Nations.locale.languageCode == 'ar' ? 'en' : 'ar',
      // ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PageTwo(),
          ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('امم  Nations')),
      body: const Center(
        child: Text('Go To Page 2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateLocale,
        child: const Icon(Icons.translate),
      ),
    );
  }
}
