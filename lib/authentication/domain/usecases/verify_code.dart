// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nectar/authentication/domain/repository/base_authentication_repository.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

class VerifyCodeUsecase extends BaseUsecase<UserCredential, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  VerifyCodeUsecase({
    required this.baseAuthenticationRepository,
  });
  @override
  Future<Either<Failure, UserCredential>> call(String parameters) async {
    return await baseAuthenticationRepository.verifyCode(parameters);
  }
}
