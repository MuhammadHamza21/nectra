// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:nectar/authentication/domain/repository/base_authentication_repository.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

class SignOutUsecase extends BaseUsecase<void, NoParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  SignOutUsecase({
    required this.baseAuthenticationRepository,
  });
  @override
  Future<Either<Failure, void>> call(NoParams parameters) async {
    return await baseAuthenticationRepository.signOut(parameters);
  }
}
