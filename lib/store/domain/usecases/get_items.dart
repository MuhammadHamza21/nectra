// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';
import 'package:nectar/store/domain/entities/item.dart';
import 'package:nectar/store/domain/repository/base_store_repository.dart';

class GetItems extends BaseUsecase<List<Item>, List<String>> {
  final BaseStoreRepository baseStoreRepository;
  GetItems({
    required this.baseStoreRepository,
  });

  @override
  Future<Either<Failure, List<Item>>> call(List<String> parameters) async {
    return await baseStoreRepository.getItems(parameters);
  }
}
