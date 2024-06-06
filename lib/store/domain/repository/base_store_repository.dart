import 'package:dartz/dartz.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/store/domain/entities/category.dart';

abstract class BaseStoreRepository {
  Future<Either<Failure, List<Category>>> getCategories(String parentId);
}
