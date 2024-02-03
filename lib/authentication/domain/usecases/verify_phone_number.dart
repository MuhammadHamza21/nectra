// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:nectar/authentication/domain/repository/base_authentication_repository.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

class VerifyPhoneNumberUsecase extends BaseUsecase<void, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  VerifyPhoneNumberUsecase({
    required this.baseAuthenticationRepository,
  });

  @override
  Future<Either<Failure, void>> call(String parameters) async {
    return baseAuthenticationRepository.verifyPhoneNumber(parameters);
  }
}
