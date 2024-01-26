import 'package:dio/dio.dart';
import 'package:nectar/core/constants/api_constants.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> deleteData(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> updateData(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
