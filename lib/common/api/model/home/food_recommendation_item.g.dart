// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_recommendation_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodRecommendationItem _$FoodRecommendationItemFromJson(
        Map<String, dynamic> json) =>
    FoodRecommendationItem(
      id: json['id'] as String,
      foodCategory: json['food_category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$FoodRecommendationItemToJson(
        FoodRecommendationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food_category': instance.foodCategory,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };
