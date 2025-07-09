import '../../common/api/model/model.dart';

abstract interface class AbstractUserRepository {
  Future<UserModel> registration(
      {required UserModel userModel, required String password});

  Future<void> login({required String email, required String password});

  Future<void> singInWithGoogle();

  Future<void> singInWithTwitter();

  Future<void> singInWithFacebook();

  Future<void> resetPassword({required String email});

  Future<void> logOut();

  Stream<UserModel> get user;

  Future<void> setUserData(UserModel userModel);

  Future<UserModel> getMyUser(String myUserId);
}
