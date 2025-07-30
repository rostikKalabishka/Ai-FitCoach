// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutRecommendation _$WorkoutRecommendationFromJson(
        Map<String, dynamic> json) =>
    WorkoutRecommendation(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      imageUrl: json['image_url'] as String,
      recommendationItems: (json['recommendation_items'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WorkoutRecommendationToJson(
        WorkoutRecommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'subtitle': instance.subtitle,
      'recommendation_items': instance.recommendationItems,
    };
