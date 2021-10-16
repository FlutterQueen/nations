// return true if the value can be used as string interface
bool isValidStringValue(dynamic value) => value != null && value is String;
// return true if the value can be used as gender interface
bool isValidGenderMap(dynamic value) {
  return value is Map &&
      (value).keys.contains('male') &&
      (value).keys.contains('female');
}

bool isValidArgs(dynamic value) =>
    value != null && value is Map<String, dynamic> && value.isNotEmpty;
