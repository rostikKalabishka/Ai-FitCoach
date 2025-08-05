abstract interface class AbstractAnalyticsRepository {
  // Логування перегляду екрану
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  });

  // Логування події початку тренування
  Future<void> logWorkoutStarted({
    required String workoutType,
    required int durationMinutes,
    String? difficulty,
  });

  // Логування завершення тренування
  Future<void> logWorkoutCompleted({
    required String workoutType,
    required int durationMinutes,
    int? caloriesBurned,
  });

  // Логування перегляду вправи
  Future<void> logExerciseViewed({
    required String exerciseName,
    required String category,
  });

  // Логування натискання кнопки
  Future<void> logButtonClick({
    required String buttonName,
    String? screenName,
    Map<String, Object>? parameters,
  });

  // Логування взаємодії зі слайдером
  Future<void> logSliderInteraction({
    required String sliderName,
    required String selectedLevel,
    String? screenName,
  });

  // Логування встановлення цілі
  Future<void> logGoalSet({
    required String goalType,
    double? targetValue,
  });

  // Логування покупки підписки
  Future<void> logSubscriptionStarted({
    required String subscriptionType,
    required String duration,
  });

  // Логування кастомної події
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters, // Змінено з dynamic на Object
  });

  // Встановлення властивості користувача (наприклад, рівень фітнесу)
  Future<void> setUserFitnessLevel(String fitnessLevel);

  // Встановлення ID користувача
  Future<void> setUserId(String userId);

  // Увімкнення збору аналітики
  Future<void> enableAnalytics();
}
