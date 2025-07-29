import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkoutItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final List<String> recommendationItems;

  const WorkoutItem(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.recommendationItems});

  WorkoutItem copyWith(
      {String? id,
      String? title,
      String? subtitle,
      String? imageUrl,
      List<String>? recommendationItems}) {
    return WorkoutItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
      recommendationItems: recommendationItems ?? this.recommendationItems,
    );
  }

  Map<String, dynamic> toJson() => _$WorkoutItemToJson(this);

  factory WorkoutItem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutItemFromJson(json);

  factory WorkoutItem.empty() => WorkoutItem(
      title: '', subtitle: '', imageUrl: '', id: '', recommendationItems: []);

  @override
  List<Object?> get props =>
      [id, title, subtitle, imageUrl, recommendationItems];
}
