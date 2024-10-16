// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String descriptionEn;
  final String descriptionAr;
  final double price;
  final double oldPrice;
  final double reviews;
  final int totalReviews;
  final List<String> groups;
  final String measureUnit;
  final List<String> subMeasureUnits;
  const Item({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.oldPrice,
    required this.reviews,
    required this.totalReviews,
    required this.groups,
    required this.measureUnit,
    required this.subMeasureUnits,
  });

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        image,
        descriptionAr,
        descriptionEn,
        price,
        oldPrice,
        reviews,
        totalReviews,
        groups,
        measureUnit,
        subMeasureUnits,
      ];
}
