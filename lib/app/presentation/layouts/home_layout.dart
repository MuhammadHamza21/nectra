import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      final appCubit = AppCubit.get(context);
      return Scaffold(
        body: appCubit.screens[appCubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appCubit.currentIndex,
          onTap: (value) {
            appCubit.changeCurrentIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.storefront_outlined,
              ),
              label: AppStrings.shop(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.manage_search_rounded,
              ),
              label: AppStrings.explore(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              label: AppStrings.cart(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite_border,
              ),
              label: AppStrings.favourites(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle_outlined,
              ),
              label: AppStrings.account(context),
            ),
          ],
        ),
      );
    });
  }
}
