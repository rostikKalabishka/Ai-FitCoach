// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      age: (json['age'] as num).toInt(),
      experience: json['experience'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'experience': instance.experience,
    };
