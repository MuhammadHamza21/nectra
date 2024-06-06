import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nectar/store/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.image,
    required super.parentId,
  });

  factory CategoryModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      CategoryModel(
        id: json['id'] ?? "",
        nameEn: json['name_en'] ?? "",
        nameAr: json['name_ar'] ?? "",
        image: json['image'] ?? "",
        parentId: json['parent_id'] ?? "",
      );
}
