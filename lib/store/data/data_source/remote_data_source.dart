import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';
import 'package:nectar/store/data/models/category_model.dart';

abstract class BaseStoreRemoteDatasource {
  Future<List<CategoryModel>> getCategories(String parentId);
}

class StoreRemoteDatasource extends BaseStoreRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<CategoryModel>> getCategories(String parentId) async {
    try {
      return await Isolate.run(() async {
        var response = await _firebaseFirestore
            .collection("Categories")
            // .where(
            //   'parent_id',
            //   isEqualTo: parentId,
            // )
            .get();
        print(response.docs.length);
        return List<CategoryModel>.from(
          (response.docs as List).map(
            (e) => CategoryModel.fromSnapshot(e),
          ),
        );
        //     .then(
        //   (value) async {
        //     print("Velcome");
        //     var result = value.docs;
        //     var response = List<CategoryModel>.from(
        //       (result as List).map(
        //         (e) => CategoryModel.fromJson(e),
        //       ),
        //     );
        //     print(response.length);
        //     return response;
        //   },
        // ).catchError((onError) {
        //   print("Error: $onError");
        //   throw ServerException(message: onError.toString());
        // });
      });
    } on FirebaseException catch (e) {
      print(e.message);
      throw ServerException(message: AppConstants.serverErrorMessage);
    }
  }
}
