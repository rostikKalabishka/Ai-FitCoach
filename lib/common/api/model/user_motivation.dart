import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_motivation.g.dart';

enum FitnessLevel { beginner, amateur, intermediate, expert }

enum Goal { loseWeight, gainMuscle, keepFit }

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserMotivation extends Equatable {
  final bool stressReduction; // Зменшення стресу
  final bool eventTraining; // Підготовка до події
  final bool rehabilitation; // Реабілітація
  final bool improveHealth; // Покращення здоров’я
  final bool buildStrength; // Нарощування сили
  final bool boostImmune; // Підвищення імунітету
  final bool boostLibido; // Підвищення лібідо

  const UserMotivation({
    this.stressReduction = false,
    this.eventTraining = false,
    this.rehabilitation = false,
    this.improveHealth = false,
    this.buildStrength = false,
    this.boostImmune = false,
    this.boostLibido = false,
  });

  // Convert to list of selected motivations (for UI or API)
  List<String> toList() => [
        if (stressReduction) 'Зменшення стресу',
        if (eventTraining) 'Підготовка до події',
        if (rehabilitation) 'Реабілітація',
        if (improveHealth) 'Покращення здоров’я',
        if (buildStrength) 'Нарощування сили',
        if (boostImmune) 'Підвищення імунітету',
        if (boostLibido) 'Підвищення лібідо',
      ];

  // Create from list of motivations
  // factory Motivation.fromList(List<String> motivations) {
  //   return Motivation(
  //     stressReduction: motivations.contains('Зменшення стресу'),
  //     eventTraining: motivations.contains('Підготовка до події'),
  //     rehabilitation: motivations.contains('Реабілітація'),
  //     improveHealth: motivations.contains('Покращення здоров’я'),
  //     buildStrength: motivations.contains('Нарощування сили'),
  //     boostImmune: motivations.contains('Підвищення імунітету'),
  //     boostLibido: motivations.contains('Підвищення лібідо'),
  //   );
  // }

  // JSON serialization
  Map<String, dynamic> toJson() => _$UserMotivationToJson(this);

  // JSON deserialization
  factory UserMotivation.fromJson(Map<String, dynamic> json) =>
      _$UserMotivationFromJson(json);

  @override
  List<Object?> get props => [
        stressReduction,
        eventTraining,
        rehabilitation,
        improveHealth,
        buildStrength,
        boostImmune,
        boostLibido,
      ];
}
