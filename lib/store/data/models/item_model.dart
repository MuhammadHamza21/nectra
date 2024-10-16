import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nectar/store/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel(
      {required super.id,
      required super.nameEn,
      required super.nameAr,
      required super.image,
      required super.descriptionEn,
      required super.descriptionAr,
      required super.price,
      required super.oldPrice,
      required super.reviews,
      required super.totalReviews,
      required super.groups,
      required super.measureUnit,
      required super.subMeasureUnits});

  factory ItemModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      ItemModel(
        id: document.id,
        nameEn: document["name_en"] ?? "",
        nameAr: document["name_ar"] ?? "",
        image: document["image"] ?? "",
        descriptionEn: document["description_en"] ?? "",
        descriptionAr: document["description_ar"] ?? "",
        price: document["price"] ?? 0,
        oldPrice: document["old_price"] ?? 0,
        reviews: document["reviews"] ?? 0,
        totalReviews: document["total_reviews"] ?? 0,
        groups: document["groups"] ?? [],
        measureUnit: document["measure_unit"] ?? "",
        subMeasureUnits: document["sub_measure_unit"] ?? [],
      );
}
