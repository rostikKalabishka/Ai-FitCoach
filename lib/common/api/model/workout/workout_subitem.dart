import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_subitem.g.dart';

enum WorkoutCategoryType { all, newbie, medium, advanced }

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkoutSubitem extends Equatable {
  final String imageUrl;
  final String exerciseName;
  final int exerciseReps;
  final int exerciseDuration;
  final String workoutCategoryType;
  final String id;
  final String workoutId;

  const WorkoutSubitem({
    required this.imageUrl,
    required this.exerciseName,
    required this.exerciseReps,
    required this.exerciseDuration,
    required this.workoutCategoryType,
    required this.id,
    required this.workoutId,
  });

  WorkoutSubitem copyWith({
    String? imageUrl,
    String? exerciseName,
    int? exerciseReps,
    int? exerciseDuration,
    String? workoutCategoryType,
    String? id,
    String? workoutId,
  }) {
    return WorkoutSubitem(
      imageUrl: imageUrl ?? this.imageUrl,
      exerciseName: exerciseName ?? this.exerciseName,
      exerciseReps: exerciseReps ?? this.exerciseReps,
      exerciseDuration: exerciseDuration ?? this.exerciseDuration,
      workoutCategoryType: workoutCategoryType ?? this.workoutCategoryType,
      workoutId: workoutId ?? this.workoutId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() => _$WorkoutSubitemToJson(this);

  factory WorkoutSubitem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSubitemFromJson(json);

  @override
  List<Object?> get props => [
        imageUrl,
        exerciseName,
        exerciseReps,
        exerciseDuration,
        workoutCategoryType,
        workoutId,
        id
      ];
}
