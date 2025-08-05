import 'package:ai_fit_coach/repositories/crashlytics_repository/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsRepository implements AbstractCrashlyticsRepository {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    try {
      await _crashlytics.setCrashlyticsCollectionEnabled(enabled);
    } catch (e) {
      debugPrint('Error setting Crashlytics collection: $e');
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    try {
      await _crashlytics.setUserIdentifier(userId);
    } catch (e) {
      debugPrint('Error setting user ID: $e');
    }
  }

  @override
  Future<void> recordError(dynamic exception, StackTrace? stackTrace,
      {bool fatal = false}) async {
    try {
      await _crashlytics.recordError(exception, stackTrace, fatal: fatal);
    } catch (e) {
      debugPrint('Error recording Crashlytics error: $e');
    }
  }

  @override
  Future<void> log(String message) async {
    try {
      await _crashlytics.log(message);
    } catch (e) {
      debugPrint('Error logging Crashlytics message: $e');
    }
  }
}
