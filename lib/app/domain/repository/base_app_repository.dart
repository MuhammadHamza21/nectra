import 'package:dartz/dartz.dart';
import 'package:nectar/app/domain/usecases/save_data.dart';
import 'package:nectar/core/error/failures.dart';

abstract class BaseAppRepository {
  Future<Either<Failure, dynamic>> getSavedData(String key);
  Future<Either<Failure, bool>> saveData(SaveDataParams params);
}
