import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/authentication/presentation/screens/login_screen.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/navigations/navigate_and_finish.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/user/presentation/screens/load_categories_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          const Spacer(),
          AppTextButton(
            backgroundColor: AppColors.lighterrGreyColor,
            onPressed: () async {
              navigateTo(
                context,
                const LoadCategoriesScreen(),
              );
            },
            child: const Text(
              "Load Data",
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          verticalSpacing(15),
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return AppTextButton(
                backgroundColor: AppColors.lighterrGreyColor,
                onPressed: () async {
                  final authCubit = AuthenticationCubit.get(context);
                  await authCubit.signOut();
                },
                child: Text(
                  AppStrings.signOut(context),
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is SignOutSuccessState) {
                navigateAndFinish(context, const LoginScreen());
              }
            },
          ),
          verticalSpacing(24),
        ],
      ),
    );
  }
}
