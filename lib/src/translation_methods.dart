import 'dart:developer';

import 'enums.dart';
import 'extract.dart';

String tr(String key) {
  return ExtractedData.from(key).toString();
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
  return extract(key).toString();
}

String trFemale(String key) {
  // return extract(key)['female']).value;
  return extract(key).toString();
}

String gender(String key, [Gender? gender]) {
  final data = ExtractedData.from(key);
  return data.toGender(gender);
}