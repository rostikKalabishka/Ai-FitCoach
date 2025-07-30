import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

import 'model/model.dart';

class UserApiClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _usersCollection = FirebaseFirestore.instance.collection('user');

  Future<UserModel> getMyUserById(String myUserId) async {
    try {
      return _usersCollection.doc(myUserId).get().then(
            (user) => UserModel.fromJson(user.data()!),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserInfo({required UserModel userModel}) async {
    try {
      await _usersCollection.doc(userModel.id).update(userModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> registration(
      {required UserModel userModel, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: userModel.email, password: password);

      userModel = userModel.copyWith(id: userCredential.user?.uid);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUserData(UserModel userModel) async {
    try {
      await _usersCollection.doc(userModel.id).set(userModel.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield UserModel.emptyUser;
      } else {
        try {
          final userDoc = await _usersCollection.doc(firebaseUser.uid).get();
          if (userDoc.exists) {
            yield UserModel.fromJson(userDoc.data()!);
          } else {
            yield UserModel.emptyUser;
          }
        } catch (e) {
          log('Error fetching user data: $e');
          yield UserModel.emptyUser;
        }
      }
    });
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken? accessToken = loginResult.accessToken;

        if (accessToken == null) {
          print('Facebook login success, але AccessToken відсутній');
          return;
        }

        print('Facebook Access Token: ${accessToken.tokenString}');
        print('Token expires: ${accessToken.tokenString}');

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null && firebaseUser.uid.isNotEmpty) {
          final existingDoc =
              await _usersCollection.doc(firebaseUser.uid).get();

          if (!existingDoc.exists) {
            final userModel = UserModel.emptyUser.copyWith(
              id: firebaseUser.uid,
              username: firebaseUser.displayName,
              email: firebaseUser.email,
            );

            await setUserData(userModel);
          }
        }
      } else {
        print(
            'Facebook login failed: ${loginResult.status} - ${loginResult.message}');
      }
    } catch (e) {
      print('Facebook sign-in error: $e');
      rethrow;
    }
  }

  Future<void> singInWithGoogle() async {
    try {
      final googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        return;
      } else {
        final googleAuth = await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          final DocumentSnapshot existingDoc =
              await _usersCollection.doc(firebaseUser.uid).get();
          if (!existingDoc.exists) {
            final userModel = UserModel.emptyUser.copyWith(
              id: firebaseUser.uid,
              username: googleSignInAccount.displayName,
              email: googleSignInAccount.email,
            );
            await setUserData(userModel);
          }
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      final twitterProvider = TwitterAuthProvider();

      final UserCredential userCredential =
          await _firebaseAuth.signInWithProvider(twitterProvider);

      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final existingDoc = await _usersCollection.doc(firebaseUser.uid).get();

        if (!existingDoc.exists) {
          final userModel = UserModel.emptyUser.copyWith(
            id: firebaseUser.uid,
            username: firebaseUser.displayName ?? 'Unknown',
            email: firebaseUser.email ?? '',
          );

          await setUserData(userModel);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAccount(String userId) async {
    try {
      await _usersCollection.doc('DuuzJTgC3bXAecaEr5k6YEbpvQJ3').delete();
    } catch (e) {
      rethrow;
    }
  }
}
