import 'package:nectar/app/domain/usecases/save_data.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/error/exceptions.dart';
import 'package:nectar/core/local/cache_helper.dart';

abstract class BaseAppLocalDatasource {
  Future<dynamic> getSavedData(String key);
  Future<bool> saveData(SaveDataParams params);
}

class AppLocalDatasource extends BaseAppLocalDatasource {
  @override
  Future<dynamic> getSavedData(String key) async {
    try {
      return await CacheHelper.getData(key: key);
    } catch (_) {
      throw LocalException(message: AppConstants.localErrorMessage);
    }
  }

  @override
  Future<bool> saveData(SaveDataParams params) async {
    try {
      return await CacheHelper.saveData(
        key: params.key,
        value: params.value,
      );
    } catch (_) {
      throw LocalException(message: AppConstants.localErrorMessage);
    }
  }
}
