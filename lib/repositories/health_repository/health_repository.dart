import 'package:health/health.dart';
import 'package:ai_fit_coach/repositories/health_repository/abstract_health_repository.dart';

class HealthRepository implements AbstractHealthRepository {
  final Health _health = Health();

  HealthRepository() {
    _configure();
  }

  Future<void> _configure() async {
    try {
      await _health.configure();
    } catch (e) {
      print('Health configuration error: $e');
    }
  }

  @override
  Future<int> getSteps() async {
    return getStepsForDate(DateTime.now());
  }

  @override
  Future<int> getStepsForDate(DateTime date) async {
    final types = [HealthDataType.STEPS];
    final permissions = [HealthDataAccess.READ];

    try {
      final authorized =
          await _health.requestAuthorization(types, permissions: permissions);
      if (!authorized) {
        throw Exception('Authorization to health data denied');
      }

      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(Duration(days: 1));

      final steps = await _health.getTotalStepsInInterval(start, end);
      return steps ?? 0;
    } catch (e) {
      print('Error getting steps: $e');
      return 0;
    }
  }
}
