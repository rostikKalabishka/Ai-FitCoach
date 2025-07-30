import 'package:ai_fit_coach/common/api/model/recommendation_item/recommendation_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_recommendation_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FoodRecommendationItem extends RecommendationItem {
  final String foodCategory;

  const FoodRecommendationItem({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required this.foodCategory,
    required super.recommendationItems,
  });

  factory FoodRecommendationItem.fromJson(Map<String, dynamic> json) =>
      _$FoodRecommendationItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodRecommendationItemToJson(this);

  factory FoodRecommendationItem.empty() => FoodRecommendationItem(
        id: '',
        title: '',
        description: '',
        imageUrl: '',
        foodCategory: '',
        recommendationItems: [],
      );

  FoodRecommendationItem copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? foodCategory,
    List<String>? recommendationItems,
  }) {
    return FoodRecommendationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      foodCategory: foodCategory ?? this.foodCategory,
      recommendationItems: recommendationItems ?? this.recommendationItems,
    );
  }

  @override
<<<<<<< HEAD
<<<<<<< HEAD
  List<Object?> get props => super.props..addAll([id, title, description, imageUrl, foodCategory, recommendationItems]);
=======
  List<Object?> get props => super.props..addAll([foodCategory, recommendationItems]);
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
=======
  List<Object?> get props => super.props..addAll([id, title, description, imageUrl, foodCategory, recommendationItems]);
>>>>>>> 65fafef (food, challenges methods, conn to ux/ui)
}
