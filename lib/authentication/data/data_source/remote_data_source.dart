import 'package:firebase_auth/firebase_auth.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/error/exceptions.dart';

abstract class BaseAuthenticationRemoteDatasource {
  Future<UserCredential> signInWithEmailAndPassword(SignInParams params);
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams params);
  User? getCurrentUser();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<UserCredential> verifyCode(String code);
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
      throw ServerException(message: failure.code);
    }
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    return await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<UserCredential> verifyCode(String code) async {
    try {
      String smsCode = code;
      // String? verificationId;
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: "", smsCode: smsCode);
      var user = await _firebaseAuth.signInWithCredential(credential);
      print("Phone Number is: ${user.user!.phoneNumber}");
      return user;
    } on FirebaseAuthException catch (failure) {
      throw ServerException(message: failure.code);
    }
  }
}
