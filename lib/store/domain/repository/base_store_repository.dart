import 'package:dartz/dartz.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/domain/entities/item.dart';
import 'package:nectar/store/domain/usecases/save_category.dart';
import 'package:nectar/store/domain/usecases/save_item.dart';

abstract class BaseStoreRepository {
  Future<Either<Failure, List<Category>>> getCategories(String? parentId);
  Future<Either<Failure, List<Item>>> getItems(List<String> groups);
  Future<Either<Failure, void>> saveCategory(SavingCategoryParams params);
  Future<Either<Failure, void>> saveItem(ItemParams params);
}
