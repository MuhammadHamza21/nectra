import 'package:firebase_auth/firebase_auth.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/error/exceptions.dart';

abstract class BaseAuthenticationRemoteDatasource {
  Future<UserCredential> signInWithEmailAndPassword(SignInParams params);
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams params);
  User? getCurrentUser();
}

class AuthenticationRemoteDatasource
    extends BaseAuthenticationRemoteDatasource {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams params) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      await user.user!.updateDisplayName(params.userName);
      return user;
    } on FirebaseAuthException catch (failure) {
      throw ServerException(message: failure.code);
    }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(SignInParams params) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return user;
    } on FirebaseAuthException catch (failure) {
      throw ServerException(message: failure.message ?? "Errorrrrrrrrrrrrrrrr");
    }
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
