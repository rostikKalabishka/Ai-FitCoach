import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const String parentDocId = 'workout';

class WorkoutRepository implements AbstractWorkoutRepository {
  Future<void> saveWorkoutItemInSubcollection(
      WorkoutItem item, String subcollectionName) async {
    final generatedId = Uuid().v4();
    final newItem = item.copyWith(id: generatedId);

    final docRef = FirebaseFirestore.instance
        .collection('workout')
        .doc(parentDocId)
        .collection(subcollectionName)
        .doc(generatedId);

    await docRef.set(newItem.toJson());
  }

  @override
  Future<void> saveGymWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'gymWorkout');
  }

  @override
  Future<void> saveAbsAndCoreItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'absAndCore');
  }

  @override
  Future<void> saveMicroWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'microWorkout');
  }

  @override
  Future<void> saveHomeWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'homeWorkout');
  }

  @override
  Future<void> saveWallPilatesItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'wallPilates');
  }

  @override
  Future<void> saveStretchingAndFlexibilityItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'stretchingAndFlexibility');
  }

  @override
  Future<void> saveYogaItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'yoga');
  }

  @override
  Future<void> saveWalkingWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'walkingWorkout');
  }

  @override
  Future<void> saveRunningWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'runningWorkout');
  }

  @override
  Future<void> saveTreadmillWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'treadmillWorkout');
  }

  @override
  Future<void> saveKegelAndPelvicFloorItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'kegelAndPelvicFloor');
  }

  @override
  Future<void> saveBackPainReliefItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'backPainRelief');
  }

  @override
  Future<void> saveSeniorWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'seniorWorkout');
  }

  @override
  Future<void> saveWhellchairWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'whellchairWorkout');
  }

  @override
  Future<void> saveBodyweightOnlyItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'bodyweightOnly');
  }

  @override
  Future<void> saveDanceWorkoutItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'danceWorkout');
  }

  @override
  Future<void> saveBalanceAndStabilityItem(WorkoutItem item) async {
    await saveWorkoutItemInSubcollection(item, 'balanceAndStability');
  }

  Future<void> gymWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Gym Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveGymWorkoutItem(item);
      print('saveGymWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> absAndCore() async {
    final item = WorkoutItem(
      id: '',
      title: 'Abs and Core',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveAbsAndCoreItem(item);
      print('saveAbsAndCoreItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> microWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Micro Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveMicroWorkoutItem(item);
      print('saveMicroWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> homeWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Home Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveHomeWorkoutItem(item);
      print('saveHomeWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> wallPilates() async {
    final item = WorkoutItem(
      id: '',
      title: 'Wall Pilates',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveWallPilatesItem(item);
      print('saveWallPilatesItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> stretchingAndFlexibility() async {
    final item = WorkoutItem(
      id: '',
      title: 'Stretching and Flexibility',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveStretchingAndFlexibilityItem(item);
      print('saveStretchingAndFlexibilityItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> yoga() async {
    final item = WorkoutItem(
      id: '',
      title: 'Yoga',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveYogaItem(item);
      print('saveYogaItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> walkingWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Walking Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveWalkingWorkoutItem(item);
      print('saveWalkingWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> runningWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Running Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveRunningWorkoutItem(item);
      print('saveRunningWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> treadmillWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Treadmill Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveTreadmillWorkoutItem(item);
      print('saveTreadmillWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> kegelAndPelvicFloor() async {
    final item = WorkoutItem(
      id: '',
      title: 'Kegel and Pelvic Floor',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveKegelAndPelvicFloorItem(item);
      print('saveKegelAndPelvicFloorItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> backPainRelief() async {
    final item = WorkoutItem(
      id: '',
      title: 'Back Pain Relief',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveBackPainReliefItem(item);
      print('saveBackPainReliefItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> seniorWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Senior Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveSeniorWorkoutItem(item);
      print('saveSeniorWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> whellchairWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Whellchair Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveWhellchairWorkoutItem(item);
      print('saveWhellchairWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> bodyweightOnly() async {
    final item = WorkoutItem(
      id: '',
      title: 'Bodyweight Only',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveBodyweightOnlyItem(item);
      print('saveBodyweightOnlyItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> danceWorkout() async {
    final item = WorkoutItem(
      id: '',
      title: 'Dance Workout',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveDanceWorkoutItem(item);
      print('saveDanceWorkoutItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> balanceAndStability() async {
    final item = WorkoutItem(
      id: '',
      title: 'Balance and Stability',
      subtitle: '',
      imageUrl: '',
    );

    try {
      await saveBalanceAndStabilityItem(item);
      print('saveBalanceAndStabilityItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  @override
  Future<List<WorkoutItem>> getWorkoutItemsFromSubcollection(
      String subcollectionName) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('workout')
          .doc(parentDocId)
          .collection(subcollectionName)
          .get();
      return snapshot.docs
          .map((doc) => WorkoutItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching items from $subcollectionName: $e');
      rethrow;
    }
  }

// trendingWorkout homepage method
  @override
  Future<List<WorkoutItem>> getWorkoutItemsFromCollection() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('trendingWorkout')
          .get();
      return snapshot.docs
          .map((doc) => WorkoutItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}