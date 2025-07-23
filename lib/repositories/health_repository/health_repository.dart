import 'package:ai_fit_coach/repositories/health_repository/abstract_health_repository.dart';
import 'package:health/health.dart';

class HealthRepository implements AbstractHealthRepository {
  final Health health = Health();

  HealthRepository() {
    _configureHealth();
  }

  Future<void> _configureHealth() async {
    try {
      await health.configure();
    } catch (e) {
      print('Error configuring Health: $e');
      rethrow;
    }
  }

  @override
  Future<int> getSteps() async {
    return getStepsForDate(DateTime.now());
  }

  @override
  Future<int> getStepsForDate(DateTime date) async {
    final types = [HealthDataType.STEPS];

    try {
      bool requested = await health.requestAuthorization(types);
      if (!requested) {
        throw Exception('Health data authorization failed');
      }

      final startTime = DateTime(date.year, date.month, date.day);
      final endTime = startTime.add(Duration(days: 1));

      int? steps = await health.getTotalStepsInInterval(startTime, endTime);

      return steps ?? 0;
    } catch (e) {
      print('Error fetching steps for $date: $e');
      rethrow;
    }
  }
}
