import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nectar/authentication/data/models/user_model.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/save_user_data.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/constants/api_constants.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';

abstract class BaseAuthenticationRemoteDatasource {
  Future<UserCredential> signInWithEmailAndPassword(SignInParams params);
  Future<UserCredential> createUserWithEmailAndPassword(
      CreateUserParams params);
  User? getCurrentUser();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<UserCredential> verifyCode(String code);
  Future<void> saveUserData(UserDataParams user);
  Future<void> signOut();
}

class AuthenticationRemoteDatasource
    extends BaseAuthenticationRemoteDatasource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
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

  @override
  Future<void> saveUserData(UserDataParams user) async {
    final userModel = UserModel(
      userName: user.userName,
      email: user.email,
      userId: user.userId,
    );
    try {
      await _firebaseFirestore
          .collection(ApiConstants.users)
          .doc(user.userId)
          .set(userModel.toJson(userModel));
      print("Success mohamed");
    } catch (failure) {
      print("Errorrrrrrrrrr: ${failure.toString()}");
      throw ServerException(message: AppConstants.serverErrorMessage);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (failure) {
      throw ServerException(message: AppConstants.serverErrorMessage);
    }
  }
}
