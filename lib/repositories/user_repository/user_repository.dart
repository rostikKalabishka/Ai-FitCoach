import 'package:ai_fit_coach/common/api/user_api_client.dart';
import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';
import 'package:ai_fit_coach/common/api/model/user_model.dart';

class UserRepository implements AbstractUserRepository {
  final UserApiClient _userApiClient = UserApiClient();

  @override
  Stream<UserModel> get user => _userApiClient.user;

  @override
  Future<UserModel> getMyUser(String myUserId) =>
      _userApiClient.getMyUserById(myUserId);

  @override
  Future<void> logOut() => _userApiClient.logOut();

  @override
  Future<void> login({required String email, required String password}) =>
      _userApiClient.login(email: email, password: password);

  @override
  Future<UserModel> registration(
          {required UserModel userModel, required String password}) =>
      _userApiClient.registration(userModel: userModel, password: password);

  @override
  Future<void> resetPassword({required String email}) =>
      _userApiClient.resetPassword(email: email);

  @override
  Future<void> setUserData(UserModel userModel) =>
      _userApiClient.setUserData(userModel);

  @override
  Future<void> singInWithFacebook() => _userApiClient.signInWithFacebook();

  @override
  Future<void> singInWithGoogle() => _userApiClient.singInWithGoogle();

  @override
  Future<void> singInWithTwitter() => _userApiClient.signInWithTwitter();

  @override
  Future<void> updateUserInfo({required UserModel userModel}) =>
      _userApiClient.updateUserInfo(userModel: userModel);
}
