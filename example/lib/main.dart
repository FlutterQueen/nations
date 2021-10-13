import 'package:example/keys.dart';
import 'package:flutter/material.dart';

import 'package:nations/nations.dart';

Future<void> main() async {
  // TODO :: (2)
  await Nations.boot(
    NationsConfig(
      supportedLocales: [Locale('af')],
      notFoundBuilder: (key) {
        // log('');
        return 'null';
      },
    ),
  );
  // wrap your `MaterialApp` with NationsRoot
  runApp(const NationsRoot(child: MyApp()));
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
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

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
      Nations.updateLocale(Locale(
        Nations.locale.languageCode == 'ar' ? 'en' : 'ar',
      ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('امم  Nations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Nations.locale.toString()),
            // TODO ::(4) translate
            Text(
              'basmala'.tr,
            ),
            Text('package_name'.tr),
            Text('gender'.trMale),
            Text('gender'.trFemale),
            Text('gender'.gender),
            Text('Un_Known_Key_With_Gender'.trMale),
            Text('validation.email'.tr),
            Text('validation.age.to_young'.tr),
            Text('validation.age.old_enough'.tr),
            Text('validation.age.very_old'.tr),
            Text('person'.trMale),
            Text('person'.trFemale),
            Text('person'.gender),
            Text(Tr.person.male),
            Text(Tr.validation.age.toYoung),
            Text('attributedMessage'.args({'atr1': "foo", 'atr2': 'bar'})),

            Text('apples'.plural(0)),
            Text('apples'.plural(1)),
            Text('apples'.plural(3)),
            Text('apples'.plural(4)),
            Text('apples'.plural(5)),
            Text('apples'.plural(60)),
            Text('apples'.plural(65)),
            Text('apples'.plural(70)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateLocale,
        child: const Icon(Icons.translate),
      ),
    );
  }
}
