import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/app/presentation/screens/on_boarding_screen.dart';
import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/authentication/presentation/screens/login_screen.dart';
import 'package:nectar/cart/presentation/controller/cart_cubit.dart';
import 'package:nectar/core/localization/app_localizations_setup.dart';
import 'package:nectar/core/services/service_locator.dart';
import 'package:nectar/core/themes/theme_data/dark_theme.dart';
import 'package:nectar/core/themes/theme_data/light_theme.dart';
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
          BlocProvider(
              create: (context) => sl<AppCubit>()
                ..getOnBoarding()
                ..getTheme()),
          BlocProvider(create: (context) => sl<AuthenticationCubit>()),
          BlocProvider(create: (context) => sl<CartCubit>()),
          BlocProvider(create: (context) => sl<StoreCubit>()),
          BlocProvider(create: (context) => sl<UserCubit>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Material App',
              theme: lightTheme,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallBack,
              locale: const Locale("en", ''),
              darkTheme: darkTheme,
              themeMode: appCubit.isDark ? ThemeMode.dark : ThemeMode.light,
              // themeMode: ThemeMode.dark,
              home: appCubit.isGoToOnBoarding
                  ? const OnBoardingScreen()
                  : const LoginScreen(),
            );
          },
        ),
      ),
    );
  }
}
