import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_subitem.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const String parentDocId = 'workout';

class WorkoutRepository implements AbstractWorkoutRepository {
  Future<void> saveWorkoutItemInCollection(
      WorkoutItem item) async {
    final generatedId = Uuid().v4();
    final newItem = item.copyWith(id: generatedId);
    final docRef = FirebaseFirestore.instance
        .collection('workout')
        .doc(generatedId);

    await docRef.set(newItem.toJson());
  }

  @override
  Future<List<WorkoutItem>> getWorkoutItemInCollection() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('workout')
          .get();
      return snapshot.docs
          .map((doc) => WorkoutItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching items from $e');
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

  Future<List<WorkoutSubitem>> getWorkoutExerciseItemInCollection(
      String categoryType, String workoutId ) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("workoutExercise").get();
      return snapshot.docs
          .map((doc) => WorkoutSubitem.fromJson(doc.data()))
          .where((item) => item.workoutId == workoutId && item.categoryType == categoryType)
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}



Future<void> saveWorkoutExerciseItemInCollection(
      WorkoutSubitem item) async {
    final generatedId = Uuid().v4();
    final newItem = item.copyWith(id: generatedId);
    final docRef = FirebaseFirestore.instance
        .collection('workoutExercise')
        .doc(generatedId);

    await docRef.set(newItem.toJson());
  }

Future<void> exerciseDescription() async {
    final item = WorkoutSubitem(
      id: '',
      imageUrl: '', 
      exerciseName: 'Push-ups', 
      exerciseReps: '3 sets of 12 reps', 
      workoutId: '',
      categoryType: 'advanced'
    );

    try {
      await saveExerciseItem(item);
      print('saveExerciseItem saved successfully');
    } catch (e) {
      print('Saving error $e');
    }
  }

  Future<void> saveExerciseItem(WorkoutSubitem item) async {
    await saveWorkoutExerciseItemInCollection(item);
  }
  