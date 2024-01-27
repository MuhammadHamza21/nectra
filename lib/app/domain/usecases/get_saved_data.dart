// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:nectar/app/domain/repository/base_app_repository.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

class GetSavedDataUsecase extends BaseUsecase<dynamic, String> {
  final BaseAppRepository baseAppRepository;
  GetSavedDataUsecase({
    required this.baseAppRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(String parameters) async {
    return await baseAppRepository.getSavedData(parameters);
  }
}
