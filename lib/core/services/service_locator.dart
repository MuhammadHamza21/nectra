import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nectar/app/data/data_source/local_data_source.dart';
import 'package:nectar/app/data/data_source/remote_data_source.dart';
import 'package:nectar/app/data/repository/app_repository.dart';
import 'package:nectar/app/domain/repository/base_app_repository.dart';
import 'package:nectar/app/domain/usecases/get_saved_data.dart';
import 'package:nectar/app/domain/usecases/save_data.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/authentication/data/data_source/remote_data_source.dart';
import 'package:nectar/authentication/data/repository/authentication_repository.dart';
import 'package:nectar/authentication/domain/repository/base_authentication_repository.dart';
import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/gt_current_user.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
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
    sl.registerFactory(() => AppCubit(sl(), sl()));
    sl.registerFactory(() => AuthenticationCubit(sl(), sl(), sl()));
    sl.registerFactory(() => CartCubit());
    sl.registerFactory(() => StoreCubit());
    sl.registerFactory(() => UserCubit());
    // repositories
    sl.registerLazySingleton<BaseAppRepository>(
      () => AppRepository(
        baseAppRemoteDatasource: sl(),
        baseAppLocalDatasource: sl(),
        baseNetworkInfo: sl(),
      ),
    );
    sl.registerLazySingleton<BaseAuthenticationRepository>(
      () => AuthenticationRepository(
        baseNetworkInfo: sl(),
        baseAuthenticationRemoteDatasource: sl(),
      ),
    );
    // data_source
    sl.registerLazySingleton<BaseAppRemoteDatasource>(
        () => AppRemoteDatasource());
    sl.registerLazySingleton<BaseAppLocalDatasource>(
        () => AppLocalDatasource());
    sl.registerLazySingleton<BaseAuthenticationRemoteDatasource>(
        () => AuthenticationRemoteDatasource());
    // usecases
    sl.registerLazySingleton(() => SaveDataUsecase(baseAppRepository: sl()));
    sl.registerLazySingleton(
        () => GetSavedDataUsecase(baseAppRepository: sl()));
    sl.registerLazySingleton(() =>
        SignInWithEmailAndPasswordUsecase(baseAuthenticationRepository: sl()));
    sl.registerLazySingleton(() => CreateUserWithEmailAndPasswordUsecase(
        baseAuthenticationRepository: sl()));
    sl.registerLazySingleton(
        () => GetCurrentUserUsecase(baseAuthenticationRepository: sl()));
    // external
    DioHelper.init();
    await CacheHelper.init();
    Firebase.initializeApp();
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(internetConnectionChecker: sl()));
  }
}
