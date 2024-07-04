import 'package:dartz/dartz.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/domain/usecases/save_category.dart';

abstract class BaseStoreRepository {
  Future<Either<Failure, List<Category>>> getCategories(String? parentId);
  Future<Either<Failure, void>> saveCategory(SavingCategoryParams params);
}
