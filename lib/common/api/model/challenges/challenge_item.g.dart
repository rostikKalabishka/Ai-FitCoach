// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) =>
    ChallengeItem(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ChallengeItemToJson(ChallengeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };
