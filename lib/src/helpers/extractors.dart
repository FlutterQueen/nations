import 'package:collection/collection.dart';

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

// * extract the value by the key
/// can dig deeper into the json (support for nested translations)
/// if the key is not nested return the value
/// if the key is not nested return go deep in the value
/// if the key value is not found return null
Object? transFromMap(String path, Map values) {
  /// extract if no parent
  if (!path.contains('.')) return values[path];

  /// split and remove empty
  final keys = path.split('.')..removeWhere((e) => e.isEmpty);

  /// if the key is nested
  if (keys.isNotEmpty) {
    if (keys.length == 1) return values[keys.first];
    final firstKey = keys.first;
    if (values[firstKey] != null && values[firstKey] is Map) {
      final newKey = path.replaceFirst('$firstKey.', '');
      return transFromMap(newKey, values[firstKey] as Map);
    }
  }
}

/// * merges to maps into single one
/// * if the key found in both maps it will use the one from the second map
dynamic mergeTwoMaps(dynamic a, dynamic b) {
  if (a is Map<String, Object?> && b is Map<String, Object?>) {
    return mergeMaps<String, dynamic>(a, b, value: mergeTwoMaps);
  }
  return b;
}
