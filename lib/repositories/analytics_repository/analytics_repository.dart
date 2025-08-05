import 'package:firebase_analytics/firebase_analytics.dart';
import 'abstract_analytics_repository.dart';

class AnalyticsRepository implements AbstractAnalyticsRepository {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': screenName,
        'firebase_screen_class': screenClass ?? screenName,
      },
    );
  }

  @override
  Future<void> logWorkoutStarted({
    required String workoutType,
    required int durationMinutes,
    String? difficulty,
  }) async {
    await _analytics.logEvent(
      name: 'workout_started',
      parameters: {
        'workout_type': workoutType,
        'duration_minutes': durationMinutes,
        'difficulty': difficulty ?? 'unknown',
      },
    );
  }

  @override
  Future<void> logWorkoutCompleted({
    required String workoutType,
    required int durationMinutes,
    int? caloriesBurned,
  }) async {
    await _analytics.logEvent(
      name: 'workout_completed',
      parameters: {
        'workout_type': workoutType,
        'duration_minutes': durationMinutes,
        'calories_burned': caloriesBurned ?? 0,
      },
    );
  }

  @override
  Future<void> logExerciseViewed({
    required String exerciseName,
    required String category,
  }) async {
    await _analytics.logEvent(
      name: 'exercise_viewed',
      parameters: {
        'exercise_name': exerciseName,
        'category': category,
      },
    );
  }

  @override
  Future<void> logButtonClick({
    required String buttonName,
    String? screenName,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(
      name: 'button_click',
      parameters: {
        'button_name': buttonName,
        'screen_name': screenName ?? 'unknown',
      },
    );
  }

  @override
  Future<void> logSliderInteraction({
    required String sliderName,
    required String selectedLevel,
    String? screenName,
  }) async {
    await _analytics.logEvent(
      name: 'slider_interaction',
      parameters: {
        'slider_name': sliderName,
        'selected_level': selectedLevel,
        'screen_name': screenName ?? 'unknown',
      },
    );
  }

  @override
  Future<void> logGoalSet({
    required String goalType,
    double? targetValue,
  }) async {
    await _analytics.logEvent(
      name: 'goal_set',
      parameters: {
        'goal_type': goalType,
        'target_value': targetValue?.toString() ?? 'none',
      },
    );
  }

  @override
  Future<void> logSubscriptionStarted({
    required String subscriptionType,
    required String duration,
  }) async {
    await _analytics.logEvent(
      name: 'subscription_started',
      parameters: {
        'subscription_type': subscriptionType,
        'duration': duration,
      },
    );
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(
        name: name,
        parameters: parameters,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> setUserFitnessLevel(String fitnessLevel) async {
    await _analytics.setUserProperty(
      name: 'fitness_level',
      value: fitnessLevel,
    );
  }

  @override
  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  @override
  Future<void> enableAnalytics() async {
    await _analytics.setAnalyticsCollectionEnabled(true);
  }
}
