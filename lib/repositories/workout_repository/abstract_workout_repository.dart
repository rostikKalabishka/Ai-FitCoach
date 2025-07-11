import '../../common/api/model/workout/workout_item.dart';

abstract interface class AbstractWorkoutRepository {
  Future<List<WorkoutItem>> getWorkoutItemsFromCollection();

  Future<List<WorkoutItem>> getWorkoutItemsFromSubcollection(String subcollectionName);
}
