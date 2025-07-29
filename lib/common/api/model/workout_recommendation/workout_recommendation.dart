import 'package:ai_fit_coach/common/api/model/recommendation_item/recommendation_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_recommendation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkoutRecommendation extends RecommendationItem {
  

  const WorkoutRecommendation({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.imageUrl,
    required super.recommendationItems

  });

  factory WorkoutRecommendation.fromJson(Map<String, dynamic> json) =>
      _$WorkoutRecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutRecommendationToJson(this);

  factory WorkoutRecommendation.empty() => WorkoutRecommendation(
        id: '',
        title: '',
        subtitle: '',
        imageUrl: '',
        recommendationItems: []
      );

  WorkoutRecommendation copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? imageUrl,
    List<String>? recommendationItems,

  }) {
    return WorkoutRecommendation(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
      recommendationItems: recommendationItems ?? this.recommendationItems,
    );
  }

  @override
  List<Object?> get props => super.props..addAll([]);
}
