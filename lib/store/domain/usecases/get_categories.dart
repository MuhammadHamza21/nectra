// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/domain/repository/base_store_repository.dart';

class GetCategoriesUsecase extends BaseUsecase<List<Category>, String?> {
  final BaseStoreRepository baseStoreRepository;
  GetCategoriesUsecase({
    required this.baseStoreRepository,
  });
  @override
  Future<Either<Failure, List<Category>>> call(String? parameters) async {
    return await baseStoreRepository.getCategories(parameters);
  }
}
