import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/core/constants/api_constants.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';
import 'package:nectar/store/data/models/category_model.dart';
import 'package:nectar/store/domain/usecases/save_category.dart';

abstract class BaseStoreRemoteDatasource {
  Future<List<CategoryModel>> getCategories(String? parentId);
  Future<void> saveCategory(SavingCategoryParams params);
}

class StoreRemoteDatasource extends BaseStoreRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  @override
  Future<List<CategoryModel>> getCategories(String? parentId) async {
    try {
      var response = await _firebaseFirestore
          .collection(ApiConstants.categories)
          .where(
            'parent_id',
            isEqualTo: "8HuLQPPC5FaejKmcvNrU",
          )
          .get();
      if (response.docs.isNotEmpty) {
        return List<CategoryModel>.from(
          (response.docs as List).map(
            (e) => CategoryModel.fromSnapshot(e),
          ),
        );
      } else {
        return [];
      }
    } on FirebaseException catch (_) {
      throw ServerException(message: AppConstants.serverErrorMessage);
    }
  }

  Future<String> getImageUrl(String path, XFile image) async {
    var snapShot = await _firebaseStorage
        .ref()
        .child("$path/${image.name}")
        .putFile(File(image.path));
    return await snapShot.ref.getDownloadURL();
  }

  @override
  Future<void> saveCategory(SavingCategoryParams params) async {
    try {
      String imageUrl = await getImageUrl("categories", params.image);
      await _firebaseFirestore.collection(ApiConstants.categories).add({}).then(
        (value) async {
          await _firebaseFirestore
              .collection(ApiConstants.categories)
              .doc(value.id)
              .set({
            "name_ar": params.nameAr,
            "name_en": params.nameEn,
            "image": imageUrl,
            "parent_id": "0",
            "category_id": params.categoryId,
          });
        },
      );
    } on FirebaseException catch (e) {
      print("Errorrrrrrrrr: $e");
      throw ServerException(message: AppConstants.serverErrorMessage);
    }
  }
}
