import 'dart:developer';

import 'package:nations/nations.dart';

Map<String, dynamic> get _values => Nations.translations.values;
Map<String, dynamic> get _nationValues => Nations.translations.nationValues;

String tr(String key) {
  return ExtractedData(extract(key)).value;
}

ExtractedData extract(String key) {
  final fromValues = _transFromMap(key, _values);

  if (fromValues != null) return ExtractedData(fromValues);
  log(
    'key $key does not exist in the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );
  final fromNation = _transFromMap(key, _nationValues);
  if (fromNation != null) return ExtractedData(fromNation);
  log(
    'key $key does not exist in nation files neither the project '
    'lang files with the locale ${Nations.locale} ,, '
    'trying to get it from the nations ....',
  );
  log('cant get from the nation will return null then !');
  return ExtractedData({});
}

dynamic _transFromMap(String key, Map<String, dynamic> values) {
  if (key.contains('.')) {
    // TODO :: inner data
    // final value = values[key];
  } else {
    return values[key];
  }
}

// translate and  replace argument with the givin args
String args(String key, Map<String, dynamic> args) {
  String str = tr(key);
  for (final argKey in args.keys) {
    final decorateArgKey = ':' + argKey;
    if (str.contains(decorateArgKey)) {
      str = str.replaceFirst(decorateArgKey, args[argKey]);
    } else {
      log('''
      [nations] you are trying to replace arg $argKey but this arg does not exist
      { "$key" : ${tr(key)}
      ''');
    }
  }

  return str;
  // return removeDecoration(str);
}

String trMale(String key) {
  // TODO :: male
  return extract(key).value;
}

String trFemale(String key) {
  // return extract(key)['female']).value;
  return extract(key).value;
}

class ExtractedData {
  final dynamic data;

  ExtractedData(this.data);

  String get value {
    if (data == null) {
      return 'null';
    } else if (data is String) {
      print(data);
      print(data is String);
      return data;
    }
    log('extraction is not done correctly you have to use the right modifier ');
    return 'null';
  }
}
