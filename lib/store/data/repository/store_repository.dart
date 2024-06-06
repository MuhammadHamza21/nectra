// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';

import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/network/network_info.dart';
import 'package:nectar/store/data/data_source/remote_data_source.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/domain/repository/base_store_repository.dart';

class StoreRepository extends BaseStoreRepository {
  final BaseStoreRemoteDatasource baseStoreRemoteDatasource;
  final BaseNetworkInfo baseNetworkInfo;
  StoreRepository({
    required this.baseStoreRemoteDatasource,
    required this.baseNetworkInfo,
  });
  @override
  Future<Either<Failure, List<Category>>> getCategories(String parentId) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseStoreRemoteDatasource.getCategories(parentId);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.message));
      }
    } else {
      return const Left(
          OfflineFailure(message: AppConstants.offlineErrorMessage));
    }
  }
}
