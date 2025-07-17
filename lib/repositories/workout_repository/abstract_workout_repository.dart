import 'package:ai_fit_coach/common/api/model/workout/workout_subitem.dart';

import '../../common/api/model/workout/workout_item.dart';

abstract interface class AbstractWorkoutRepository {
  Future<List<WorkoutItem>> getWorkoutItemsFromCollection();

  Future<List<WorkoutItem>> getWorkoutItemInCollection();

  Future<List<WorkoutSubitem>> getWorkoutExerciseItemInCollection(String categoryType, String workoutId);
}
