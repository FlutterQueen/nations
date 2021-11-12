// return true if the value can be used as gender interface
bool isValidGenderMap(Map value) {
  return value.isNotEmpty &&
      (value).keys.contains('male') &&
      (value).keys.contains('female');
}
