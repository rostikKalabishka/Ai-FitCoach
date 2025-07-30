// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutItem _$WorkoutItemFromJson(Map<String, dynamic> json) => WorkoutItem(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$WorkoutItemToJson(WorkoutItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image_url': instance.imageUrl,
    };
