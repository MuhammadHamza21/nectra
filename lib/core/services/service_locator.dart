import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/cart/presentation/controller/cart_cubit.dart';
import 'package:nectar/core/local/cache_helper.dart';
import 'package:nectar/core/network/dio_helper.dart';
import 'package:nectar/core/network/network_info.dart';
import 'package:nectar/store/presentation/controller/store_cubit.dart';
import 'package:nectar/user/presentation/controller/user_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() async {
    // bloc
    sl.registerFactory(() => AppCubit());
    sl.registerFactory(() => AuthenticationCubit());
    sl.registerFactory(() => CartCubit());
    sl.registerFactory(() => StoreCubit());
    sl.registerFactory(() => UserCubit());
    // repositories
    // data_source
    // usecases
    // external
    DioHelper.init();
    await CacheHelper.init();
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(internetConnectionChecker: sl()));
  }
}
