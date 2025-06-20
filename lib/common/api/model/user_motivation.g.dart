// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_motivation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMotivation _$UserMotivationFromJson(Map<String, dynamic> json) =>
    UserMotivation(
      stressReduction: json['stress_reduction'] as bool? ?? false,
      eventTraining: json['event_training'] as bool? ?? false,
      rehabilitation: json['rehabilitation'] as bool? ?? false,
      improveHealth: json['improve_health'] as bool? ?? false,
      buildStrength: json['build_strength'] as bool? ?? false,
      boostImmune: json['boost_immune'] as bool? ?? false,
      boostLibido: json['boost_libido'] as bool? ?? false,
    );

Map<String, dynamic> _$UserMotivationToJson(UserMotivation instance) =>
    <String, dynamic>{
      'stress_reduction': instance.stressReduction,
      'event_training': instance.eventTraining,
      'rehabilitation': instance.rehabilitation,
      'improve_health': instance.improveHealth,
      'build_strength': instance.buildStrength,
      'boost_immune': instance.boostImmune,
      'boost_libido': instance.boostLibido,
    };
