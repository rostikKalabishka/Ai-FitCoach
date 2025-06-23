import 'package:ai_fit_coach/common/api/model/user_motivation.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

enum FitnessLevel { beginner, amateur, intermediate, expert }

enum Goal { loseWeight, gainMuscle, keepFit }

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserData extends Equatable {
  final int weight; // Вага в кілограмах
  final int height; // Зріст у сантиметрах
  final int age; // Вік у роках
  final List<String>
      activities; // Вибрані активності (наприклад, ["Танці", "Біг"])
  final String diet; // Вибрані дієти (наприклад, ["Веганська", "Кето"])
  final String? level; // Рівень підготовки (наприклад, beginner)
  final String? goal; // Мета (наприклад, loseWeight)
  final UserMotivation motivation; // Мотивація
  final List<String> badHabits; // Шкідливі звички
  final List<String> trainingDays; // Тренувальні дні
  final bool termsAccepted; // Згода з умовами

  const UserData({
    this.weight = 0,
    this.height = 0,
    this.age = 0,
    this.activities = const [],
    this.diet = '',
    this.level,
    this.goal,
    this.motivation = const UserMotivation(),
    this.badHabits = const [],
    this.trainingDays = const [],
    this.termsAccepted = false,
  });

  // Порожній екземпляр для початкового стану
  static const emptyUserData = UserData();

  // Метод для копіювання з можливістю оновлення полів
  UserData copyWith({
    int? weight,
    int? height,
    int? age,
    List<String>? activities,
    String? diet,
    String? level,
    String? goal,
    UserMotivation? motivation,
    List<String>? badHabits,
    List<String>? trainingDays,
    bool? termsAccepted,
  }) {
    return UserData(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      activities: activities ?? this.activities,
      diet: diet ?? this.diet,
      level: level ?? this.level,
      goal: goal ?? this.goal,
      motivation: motivation ?? this.motivation,
      badHabits: badHabits ?? this.badHabits,
      trainingDays: trainingDays ?? this.trainingDays,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }

  // Перевірка, чи заповнені всі обов’язкові поля
  bool get isComplete {
    return weight > 0 &&
        height > 0 &&
        age > 0 &&
        activities.isNotEmpty &&
        diet.isNotEmpty &&
        level != null &&
        goal != null &&
        termsAccepted;
  }

  // Серіалізація в JSON
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  // Десеріалізація з JSON
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  List<Object?> get props => [
        weight,
        height,
        age,
        activities,
        diet,
        level,
        goal,
        motivation,
        badHabits,
        trainingDays,
        termsAccepted,
      ];
}
