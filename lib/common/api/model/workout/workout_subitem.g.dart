// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_subitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSubitem _$WorkoutSubitemFromJson(Map<String, dynamic> json) =>
    WorkoutSubitem(
      imageUrl: json['image_url'] as String,
      exerciseName: json['exercise_name'] as String,
      exerciseReps: (json['exercise_reps'] as num).toInt(),
      exerciseDuration: (json['exercise_duration'] as num).toInt(),
      workoutCategoryType: json['workout_category_type'] as String,
      id: json['id'] as String,
      workoutId: json['workout_id'] as String,
    );

Map<String, dynamic> _$WorkoutSubitemToJson(WorkoutSubitem instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'exercise_name': instance.exerciseName,
      'exercise_reps': instance.exerciseReps,
      'exercise_duration': instance.exerciseDuration,
      'workout_category_type': instance.workoutCategoryType,
      'id': instance.id,
      'workout_id': instance.workoutId,
    };
