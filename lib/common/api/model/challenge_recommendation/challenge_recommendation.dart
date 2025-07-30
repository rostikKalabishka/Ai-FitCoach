import 'package:ai_fit_coach/common/api/model/recommendation_item/recommendation_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_recommendation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ChallengeRecommendation extends RecommendationItem {

  const ChallengeRecommendation({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.recommendationItems,
  });

  factory ChallengeRecommendation.fromJson(Map<String, dynamic> json) =>
      _$ChallengeRecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeRecommendationToJson(this);

  factory ChallengeRecommendation.empty() => ChallengeRecommendation(
        id: '',
        title: '',
        description: '',
        imageUrl: '',
        recommendationItems: []
      );

  ChallengeRecommendation copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<String>? recommendationItems,
  }) {
    return ChallengeRecommendation(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      recommendationItems: recommendationItems ?? this.recommendationItems,
    );
  }

  @override
  List<Object?> get props => super.props..addAll([recommendationItems]);
}

