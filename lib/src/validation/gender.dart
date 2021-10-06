bool isValidGenderMap(String key, dynamic value) {
  return value is Map &&
      (value).keys.contains('male') &&
      (value).keys.contains('female');
}
