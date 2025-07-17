import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_subitem.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkoutSubitem extends Equatable {
  final String imageUrl;
  final String exerciseName;
  final String exerciseReps;
  final String id;
  final String workoutId;
  final String categoryType;

  const WorkoutSubitem({
    required this.imageUrl,
    required this.exerciseName,
    required this.exerciseReps,
    required this.id,
    required this.workoutId,
    required this.categoryType,
  });

  WorkoutSubitem copyWith({
    String? imageUrl,
    String? exerciseName,
    String? exerciseReps,
    String? workoutCategoryType,
    String? id,
    String? workoutId,
    String? categoryType
  }) {
    return WorkoutSubitem(
      imageUrl: imageUrl ?? this.imageUrl,
      exerciseName: exerciseName ?? this.exerciseName,
      exerciseReps: exerciseReps ?? this.exerciseReps,
      workoutId: workoutId ?? this.workoutId,
      id: id ?? this.id,
      categoryType: categoryType ?? this.categoryType
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
        workoutId,
        id,
        categoryType,
      ];
}
