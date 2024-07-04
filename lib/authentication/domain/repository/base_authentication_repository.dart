import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/save_user_data.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      SignInParams params);
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      CreateUserParams params);
  User? getCurrentUser();
  Future<Either<Failure, void>> verifyPhoneNumber(String phoneNumber);
  Future<Either<Failure, UserCredential>> verifyCode(String code);
  Future<Either<Failure, void>> saveUserData(UserDataParams user);
  Future<Either<Failure, void>> signOut(NoParams parans);
}
