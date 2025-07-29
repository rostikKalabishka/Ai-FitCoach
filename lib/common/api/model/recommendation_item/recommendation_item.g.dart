// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationItem _$RecommendationItemFromJson(Map<String, dynamic> json) =>
    RecommendationItem(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String,
      subtitle: json['subtitle'] as String?,
      recommendationItems: (json['recommendation_items'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecommendationItemToJson(RecommendationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'subtitle': instance.subtitle,
      'recommendation_items': instance.recommendationItems,
    };
