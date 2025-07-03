import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_recommendation_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FoodRecommendationItem extends Equatable {
  final String id;
  final String foodCategory;
  final String title;
  final String description;
  final String imageUrl;

  const FoodRecommendationItem({
    required this.id,
    required this.foodCategory,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  FoodRecommendationItem copyWith({
    String? id,
    String? foodCategory,
    String? title,
    String? description,
    String? imageUrl,
  }) {
    return FoodRecommendationItem(
      id: id ?? this.id,
      foodCategory: foodCategory ?? this.foodCategory,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() => _$FoodRecommendationItemToJson(this);

  factory FoodRecommendationItem.fromJson(Map<String, dynamic> json) =>
      _$FoodRecommendationItemFromJson(json);

  @override
  List<Object?> get props => [id, foodCategory, title, description, imageUrl];
}
