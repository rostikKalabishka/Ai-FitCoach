// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeRecommendation _$ChallengeRecommendationFromJson(
        Map<String, dynamic> json) =>
    ChallengeRecommendation(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String,
      recommendationItems: (json['recommendation_items'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ChallengeRecommendationToJson(
        ChallengeRecommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'recommendation_items': instance.recommendationItems,
    };
