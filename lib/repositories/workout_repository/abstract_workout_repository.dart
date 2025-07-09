import '../../common/api/model/workout/workout_item.dart';

abstract interface class AbstractWorkoutRepository {
  Future<void> saveGymWorkoutItem(WorkoutItem item);

  Future<void> saveAbsAndCoreItem(WorkoutItem item);

  Future<void> saveMicroWorkoutItem(WorkoutItem item);

  Future<void> saveHomeWorkoutItem(WorkoutItem item);

  Future<void> saveWallPilatesItem(WorkoutItem item);

  Future<void> saveStretchingAndFlexibilityItem(WorkoutItem item);

  Future<void> saveYogaItem(WorkoutItem item);

  Future<void> saveWalkingWorkoutItem(WorkoutItem item);

  Future<void> saveRunningWorkoutItem(WorkoutItem item);

  Future<void> saveTreadmillWorkoutItem(WorkoutItem item);

  Future<void> saveKegelAndPelvicFloorItem(WorkoutItem item);

  Future<void> saveBackPainReliefItem(WorkoutItem item);

  Future<void> saveSeniorWorkoutItem(WorkoutItem item);

  Future<void> saveWhellchairWorkoutItem(WorkoutItem item);

  Future<void> saveBodyweightOnlyItem(WorkoutItem item);

  Future<void> saveDanceWorkoutItem(WorkoutItem item);

  Future<void> saveBalanceAndStabilityItem(WorkoutItem item);

  Future<List<WorkoutItem>> getWorkoutItemsFromCollection();

  Future<List<WorkoutItem>> getWorkoutItemsFromSubcollection(String subcollectionName);
}
