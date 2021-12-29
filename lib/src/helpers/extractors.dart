/// * takes the wanted count
/// * takes the available boundaries
/// * returns the right count boundary
/// * if none exist return the default key
/// * if there is no default return null
String? resolveCount(int count, Iterable<String> keys) {
  for (final pluralKey in keys) {
    /// single number
    if (count.toString() == pluralKey) {
      /// *  '0' or '1' or '3' or '4' or '5' ..etc
      // return keys.toString();
      return pluralKey;
    } else if (pluralKey.contains(',')) {
      /// * '0,1,2,3,4'
      // set of numbers
      for (final innerNum in pluralKey.split(',')) {
        if (innerNum == count.toString()) return pluralKey;
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
  if (keys.contains('default')) return 'default';
}
