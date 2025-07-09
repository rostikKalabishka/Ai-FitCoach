import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkoutItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;

  const WorkoutItem(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl});

  WorkoutItem copyWith(
      {String? id, String? title, String? subtitle, String? imageUrl}) {
    return WorkoutItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() => _$WorkoutItemToJson(this);

  factory WorkoutItem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutItemFromJson(json);

  @override
  List<Object?> get props => [id, title, subtitle, imageUrl];
}
