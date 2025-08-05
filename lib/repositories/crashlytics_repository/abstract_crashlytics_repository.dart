abstract interface class AbstractCrashlyticsRepository {
  Future<void> setCrashlyticsCollectionEnabled(bool enabled);
  Future<void> setUserId(String userId);
  Future<void> recordError(dynamic exception, StackTrace? stackTrace,
      {bool fatal = false});
  Future<void> log(String message);
}
