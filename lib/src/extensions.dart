import 'helpers.dart' as h;

extension NationsTrans on String {
  /// * translate a text based on the App locale
  String get tr => h.tr(this);
}
