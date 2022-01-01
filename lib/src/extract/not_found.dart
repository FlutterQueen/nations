part of 'base.dart';

/// to handle none existing keys .
class NotFoundData extends ExtractedData<void> {
  /// to handle none existing keys .
  NotFoundData(
    String key,
  ) : super(key: key, data: null);
}
