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
    final types = [HealthDataType.STEPS];

    try {
      bool requested = await health.requestAuthorization(types);
      if (!requested) {
        throw Exception('Health data authorization failed');
      }

      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);

      int? steps = await health.getTotalStepsInInterval(midnight, now);

      return steps ?? 0;
    } catch (e) {
      print('Error fetching health data: $e');
      rethrow;
    }
  }
}
