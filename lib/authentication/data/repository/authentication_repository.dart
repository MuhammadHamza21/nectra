// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nectar/authentication/data/data_source/remote_data_source.dart';
import 'package:nectar/authentication/domain/repository/base_authentication_repository.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/network/network_info.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseNetworkInfo baseNetworkInfo;
  final BaseAuthenticationRemoteDatasource baseAuthenticationRemoteDatasource;
  AuthenticationRepository({
    required this.baseNetworkInfo,
    required this.baseAuthenticationRemoteDatasource,
  });
  @override
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      CreateUserParams params) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseAuthenticationRemoteDatasource
            .createUserWithEmailAndPassword(params);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(message: failure.message),
        );
      }
    } else {
      return const Left(
          OfflineFailure(message: AppConstants.offlineErrorMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      SignInParams params) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseAuthenticationRemoteDatasource
            .signInWithEmailAndPassword(params);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.message));
      }
    } else {
      return const Left(
          OfflineFailure(message: AppConstants.offlineErrorMessage));
    }
  }

  @override
  User? getCurrentUser() {
    return baseAuthenticationRemoteDatasource.getCurrentUser();
  }
}
