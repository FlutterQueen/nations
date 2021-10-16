part of 'data.dart';

String? resolveCount(int count, List<String> keys) {
  for (final pluralKey in keys) {
    /// single number
    if (count.toString() == pluralKey) {
      /// *  '0' or '1'
      return pluralKey;
    } else if (pluralKey.contains(',')) {
      /// * '0,1,2,3,4'
      // set of numbers
      for (final innerNum in pluralKey.split(',')) {
        if (innerNum.toString() == count.toString()) return pluralKey;
      }
    } else if (pluralKey.contains('-')) {
      /// * 50 - 80
      /// * 50 - *  50 or more
      // its a range
      final from = num.parse(pluralKey.split('-').first);
      final _lastAsStr = pluralKey.split('-').last;
      final to = _lastAsStr == '*' ? double.infinity : num.parse(_lastAsStr);
      if (count >= from && count <= to) {
        return pluralKey;
      }
    }
  }
}

dynamic _transFromMap(String key, dynamic values) {
  if (isValidArgs(values)) {
    if (key.contains('.')) {
      final keys = key.split('.');
      if (keys.length > 1) {
        final firstArg = keys.first;
        // still want to go deeper
        log('firstArg : $firstArg');
        final newKey = key.replaceFirst('$firstArg.', '');
        log('newKey : $newKey');
        return _transFromMap(newKey, values[firstArg]);
      } else {
        return values[keys.first];
      }
    } else {
      return values[key];
    }
  }
  return values;
}
