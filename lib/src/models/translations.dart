/// * ### DTO to Holds loaded translations
class NTranslations {
  /// user locale values
  final Map<String, dynamic> values;

  /// nations locale values
  final Map<String, dynamic> nationValues;

  NTranslations({
    required this.values,
    required this.nationValues,
  });
}
