// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';
import 'package:nectar/store/domain/repository/base_store_repository.dart';

class SaveCategoryUsercase extends BaseUsecase<void, SavingCategoryParams> {
  final BaseStoreRepository baseStoreRepository;
  SaveCategoryUsercase({
    required this.baseStoreRepository,
  });
  @override
  Future<Either<Failure, void>> call(SavingCategoryParams parameters) async {
    return await baseStoreRepository.saveCategory(parameters);
  }
}

class SavingCategoryParams extends Equatable {
  final String nameAr;
  final String nameEn;
  final XFile image;
  const SavingCategoryParams({
    required this.nameAr,
    required this.nameEn,
    required this.image,
  });
  @override
  List<Object?> get props => [nameAr, nameEn, image];
}
