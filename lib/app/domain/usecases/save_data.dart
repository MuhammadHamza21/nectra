// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar/app/domain/repository/base_app_repository.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';

class SaveDataUsecase extends BaseUsecase<bool, SaveDataParams> {
  final BaseAppRepository baseAppRepository;
  SaveDataUsecase({
    required this.baseAppRepository,
  });
  @override
  Future<Either<Failure, bool>> call(SaveDataParams parameters) async {
    return await baseAppRepository.saveData(parameters);
  }
}

class SaveDataParams extends Equatable {
  final String key;
  final dynamic value;
  const SaveDataParams({
    required this.key,
    required this.value,
  });
  @override
  List<Object?> get props => [key, value];
}
