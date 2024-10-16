// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nectar/core/error/failures.dart';
import 'package:nectar/core/usecase/base_usecase.dart';
import 'package:nectar/store/domain/repository/base_store_repository.dart';

class SaveItemUsecase extends BaseUsecase<void, ItemParams> {
  final BaseStoreRepository baseStoreRepository;
  SaveItemUsecase({
    required this.baseStoreRepository,
  });
  @override
  Future<Either<Failure, void>> call(ItemParams parameters) async {
    return await baseStoreRepository.saveItem(parameters);
  }
}

class ItemParams extends Equatable {
  final String nameAr;
  final String nameEn;
  final String descriptionEn;
  final String descriptionAr;
  final double reviews;
  final int noOfReviews;
  final XFile image;
  final double price;
  final double oldPrice;
  final List<String> groups;
  final List<String> subMeasureUnits;
  final String measureUnit;
  const ItemParams({
    required this.nameAr,
    required this.nameEn,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.reviews,
    required this.noOfReviews,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.groups,
    required this.subMeasureUnits,
    required this.measureUnit,
  });

  @override
  List<Object?> get props => [
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        reviews,
        noOfReviews,
        image,
        price,
        oldPrice,
        groups,
        measureUnit,
        subMeasureUnits,
      ];
}
