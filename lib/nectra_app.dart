import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/cart/presentation/controller/cart_cubit.dart';
import 'package:nectar/core/services/service_locator.dart';
import 'package:nectar/store/presentation/controller/store_cubit.dart';
import 'package:nectar/user/presentation/controller/user_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AppCubit>()),
          BlocProvider(create: (context) => sl<AuthenticationCubit>()),
          BlocProvider(create: (context) => sl<CartCubit>()),
          BlocProvider(create: (context) => sl<StoreCubit>()),
          BlocProvider(create: (context) => sl<UserCubit>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Material App',
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Material App Bar'),
                ),
                body: const Center(
                  child: Text('Hello World'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
