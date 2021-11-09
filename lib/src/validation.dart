// return true if the value can be used as gender interface
bool isValidGenderMap(Object value) {
  return value is Map &&
      value.isNotEmpty &&
      (value).keys.contains('male') &&
      (value).keys.contains('female');
}

bool isValidArgs(Object value) =>
    value is Map<String, dynamic> && value.isNotEmpty;
