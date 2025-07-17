// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_subitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSubitem _$WorkoutSubitemFromJson(Map<String, dynamic> json) =>
    WorkoutSubitem(
      imageUrl: json['image_url'] as String,
      exerciseName: json['exercise_name'] as String,
      exerciseReps: json['exercise_reps'] as String,
      id: json['id'] as String,
      workoutId: json['workout_id'] as String,
      categoryType: json['category_type'] as String,
    );

Map<String, dynamic> _$WorkoutSubitemToJson(WorkoutSubitem instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'exercise_name': instance.exerciseName,
      'exercise_reps': instance.exerciseReps,
      'id': instance.id,
      'workout_id': instance.workoutId,
      'category_type': instance.categoryType,
    };
