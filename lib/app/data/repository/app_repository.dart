// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:nectar/app/data/data_source/local_data_source.dart';
import 'package:nectar/app/data/data_source/remote_data_source.dart';
import 'package:nectar/app/domain/repository/base_app_repository.dart';
import 'package:nectar/app/domain/usecases/save_data.dart';
import 'package:nectar/core/error/exceptions.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/network/network_info.dart';

class AppRepository extends BaseAppRepository {
  final BaseAppRemoteDatasource baseAppRemoteDatasource;
  final BaseAppLocalDatasource baseAppLocalDatasource;
  final BaseNetworkInfo baseNetworkInfo;
  AppRepository({
    required this.baseAppRemoteDatasource,
    required this.baseAppLocalDatasource,
    required this.baseNetworkInfo,
  });

  @override
  Future<Either<Failure, dynamic>> getSavedData(String key) async {
    try {
      var result = await baseAppLocalDatasource.getSavedData(key);
      return Right(result);
    } on LocalException catch (failure) {
      return Left(
        LocalFailure(message: failure.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> saveData(SaveDataParams params) async {
    try {
      var result = await baseAppLocalDatasource.saveData(params);
      return Right(result);
    } on LocalException catch (failure) {
      return Left(
        LocalFailure(message: failure.message),
      );
    }
  }
}
