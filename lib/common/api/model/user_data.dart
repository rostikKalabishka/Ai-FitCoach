import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserData {
  final double weight;
  final int height;
  final int age;
  final String experience;

  const UserData(
      {required this.weight,
      required this.height,
      required this.age,
      required this.experience});

  static const emptyUserData = UserData(
    age: 0,
    weight: 0,
    height: 0,
    experience: '',
  );

  UserData copyWith({
    double? weight,
    int? height,
    int? age,
    String? experience,
  }) {
    return UserData(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      experience: experience ?? this.experience,
    );
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
