import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel extends Equatable {
  final String username;
  final String email;
  final String id;
  final UserData userData;

  const UserModel({
    required this.username,
    required this.email,
    required this.id,
    required this.userData,
  });
  bool get isEmpty => this == UserModel.emptyUser;

  static const emptyUser = UserModel(
    email: '',
    username: '',
    id: '',
    userData: UserData.emptyUserData,
  );

  @override
  List<Object?> get props => [
        username,
        email,
        id,
        userData,
      ];

  UserModel copyWith({
    String? username,
    String? email,
    String? id,
    UserData? userData,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      id: id ?? this.id,
      userData: userData ?? this.userData,
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
