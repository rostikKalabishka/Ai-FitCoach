// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      age: (json['age'] as num?)?.toInt() ?? 0,
      activities: (json['activities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      diet: json['diet'] as String? ?? '',
      level: json['level'] as String?,
      goal: json['goal'] as String?,
      motivation: json['motivation'] == null
          ? const UserMotivation()
          : UserMotivation.fromJson(json['motivation'] as Map<String, dynamic>),
      badHabits: (json['bad_habits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      trainingDays: (json['training_days'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      termsAccepted: json['terms_accepted'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'activities': instance.activities,
      'diet': instance.diet,
      'level': instance.level,
      'goal': instance.goal,
      'motivation': instance.motivation.toJson(),
      'bad_habits': instance.badHabits,
      'training_days': instance.trainingDays,
      'terms_accepted': instance.termsAccepted,
    };
