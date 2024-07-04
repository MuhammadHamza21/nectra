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
      DocumentSnapshot<Map<String, dynamic>> document) {
    return CategoryModel(
      id: document.id,
      nameEn: document['name_en'] ?? "",
      nameAr: document['name_ar'] ?? "",
      image: document['image'] ?? "",
      parentId: document['parent_id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'parent_id': parentId,
    };
  }
}
