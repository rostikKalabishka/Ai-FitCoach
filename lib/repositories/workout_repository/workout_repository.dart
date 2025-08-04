
import 'package:ai_fit_coach/common/api/model/workout/workout_subitem.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const String parentDocId = 'workout';

class WorkoutRepository implements AbstractWorkoutRepository {
  Future<void> saveWorkoutItemInCollection(WorkoutItem item) async {
    final generatedId = Uuid().v4();
    final newItem = item.copyWith(id: generatedId);
    final docRef =
        FirebaseFirestore.instance.collection('workout').doc(generatedId);

    await docRef.set(newItem.toJson());
  }

  @override
  Future<List<WorkoutItem>> getWorkoutItemInCollection() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('workout').get();
      return snapshot.docs
          .map((doc) => WorkoutItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching items from $e');
      rethrow;
    }
  }


  Future<List<WorkoutSubitem>> getWorkoutExerciseItemInCollection(
      String categoryType, String workoutId) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("workoutExercise").get();
      if (categoryType == 'all') {
        return snapshot.docs
            .map((doc) => WorkoutSubitem.fromJson(doc.data()))
            .where((item) => item.workoutId == workoutId)
            .toList();
      } else {
        return snapshot.docs
            .map((doc) => WorkoutSubitem.fromJson(doc.data()))
            .where((item) =>
                item.workoutId == workoutId &&
                item.categoryType == categoryType)
            .toList();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

Future<void> saveWorkoutExerciseItemInCollection(WorkoutSubitem item) async {
  final generatedId = Uuid().v4();
  final newItem = item.copyWith(id: generatedId);
  final docRef =
      FirebaseFirestore.instance.collection('workoutExercise').doc(generatedId);

  await docRef.set(newItem.toJson());
}

Future<void> exerciseDescription() async {
  final item = WorkoutSubitem(
      id: '',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/ai-fitcoach-8a7cf.firebasestorage.app/o/workoutExercises%2FWalking%20Meditation.png?alt=media&token=be428667-d7b3-4861-a25f-450f6dbffd53',
      exerciseName: 'Walking Meditation ',
      exerciseReps: '5 min',
      workoutId: '061e6592-b099-482b-9e87-0ba24027be8c',
      categoryType: '');

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

Future<void> exerciseDescription1() async {
  final item = WorkoutSubitem(
      id: '',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/ai-fitcoach-8a7cf.firebasestorage.app/o/workoutExercises%2FBreath-Synchronized%20Arm%20Flow.png?alt=media&token=2c820e29-79b4-498d-b36f-65adbaddf32d',
      exerciseName: "Breath-Synchronized Arm Flow ",
      exerciseReps: '3 sets of 5 min',
      workoutId: '061e6592-b099-482b-9e87-0ba24027be8c',
      categoryType: '');

  try {
    await saveExerciseItem1(item);
    print('saveExerciseItem1 saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> saveExerciseItem1(WorkoutSubitem item) async {
  await saveWorkoutExerciseItemInCollection(item);
}

Future<void> exerciseDescription2() async {
  final item = WorkoutSubitem(
      id: '',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/ai-fitcoach-8a7cf.firebasestorage.app/o/workoutExercises%2FSeated%20Grounding%20Movements.png?alt=media&token=abb75e84-eee6-4fd0-ab52-27518881ca64',
      exerciseName: 'Seated Grounding Movements ',
      exerciseReps: '5 min',
      workoutId: '061e6592-b099-482b-9e87-0ba24027be8c',
      categoryType: '');

  try {
    await saveExerciseItem2(item);
    print('saveExerciseItem2 saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> saveExerciseItem2(WorkoutSubitem item) async {
  await saveWorkoutExerciseItemInCollection(item);
}

Future<void> exerciseDescription3() async {
  final item = WorkoutSubitem(
      id: '',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/ai-fitcoach-8a7cf.firebasestorage.app/o/workoutExercises%2FClosing%20Stillness.png?alt=media&token=1106329a-4e28-40c9-8fb7-1aa2dc7b8925',
      exerciseName: "Closing Stillness ",
      exerciseReps: '5 min',
      workoutId: '061e6592-b099-482b-9e87-0ba24027be8c',
      categoryType: '');

  try {
    await saveExerciseItem3(item);
    print('saveExerciseItem3 saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> saveExerciseItem3(WorkoutSubitem item) async {
  await saveWorkoutExerciseItemInCollection(item);
}

Future<void> exerciseDescription4() async {
  final item = WorkoutSubitem(
      id: '',
      imageUrl: '',
      exerciseName: '',
      exerciseReps: '',
      workoutId: '061e6592-b099-482b-9e87-0ba24027be8c',
      categoryType: '');

  try {
    await saveExerciseItem4(item);
    print('saveExerciseItem4 saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> saveExerciseItem4(WorkoutSubitem item) async {
  await saveWorkoutExerciseItemInCollection(item);
}
