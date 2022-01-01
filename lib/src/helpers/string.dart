import 'package:flutter/material.dart';

/// localize numbers base on locale
/// if none provided it will use the app locale `Nations.locale`
/// Make sure you know the difference between arabic and hindi numbers
String numberToLocale(String str, Locale locale) {
  if (str.isEmpty) return str;
  switch (locale.languageCode) {
    case 'ar':
      return convertToArabicNumbers(str);
    case 'hi':
      return convertToHindiNumbers(str);
  }
  return str;
}

/// arabic numbers are `0123456789`
/// convert numbers to arabic format
/// `0123456789` becomes `٠١٢٣٤٥٦٧٨٩`
String convertToArabicNumbers(String str) {
  return str
      .replaceAll('٠', '0')
      .replaceAll('١', '1')
      .replaceAll('٢', '2')
      .replaceAll('٣', '3')
      .replaceAll('٤', '4')
      .replaceAll('٥', '5')
      .replaceAll('٦', '6')
      .replaceAll('٧', '7')
      .replaceAll('٨', '8')
      .replaceAll('٩', '9');
}

/// arabic numbers are `٠١٢٣٤٥٦٧٨٩`
String convertToHindiNumbers(String str) {
  return str
      .replaceAll('0', '٠')
      .replaceAll('1', '١')
      .replaceAll('2', '٢')
      .replaceAll('3', '٣')
      .replaceAll('4', '٤')
      .replaceAll('5', '٥')
      .replaceAll('6', '٦')
      .replaceAll('7', '٧')
      .replaceAll('8', '٨')
      .replaceAll('9', '٩');
}

/// takes `foo` return `Foo`
/// takes `foo bar` return `Foo bar`
String capitalizeFirstChar(String str) {
  return '${str[0].toUpperCase()}${str.substring(1)}';
}

/// takes `foo` return `Foo`
/// takes `foo bar` return `Foo Bar`
/// takes `foo bar zee` return `Foo Bar Zee`
String capitalizeFirstCharForEachWord(String str) {
  return str
      .split(' ')
      .map((s) => s.isEmpty ? '' : capitalizeFirstChar(s))
      .join(' ');
}

/// * replace args of map
/// * in your assets the arg must starts with `:` to be identified as variable
/// * to replace it
String? replaceArgsOf(String data, Map<String, Object?> args) {
  String msg = data;
  for (final arg in args.keys) {
    final val = args[arg];
    if (val != null) {
      msg = msg.replaceFirst(':$arg', args[arg].toString());
    }
  }
  return msg;
}
