import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/presentation/controller/app_cubit.dart';
import 'package:nectar/authentication/presentation/screens/login_screen.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/spacing.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              "assets/images/on_boarding_image.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30),
              child: SizedBox(
                height: 400.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo_white.png",
                    ),
                    verticalSpacing(35),
                    Text(
                      AppStrings.welcomeToOurStore(context),
                      textAlign: TextAlign.center,
                      style: TextStyles.font48WhiteRegularGilroy,
                    ),
                    verticalSpacing(7),
                    Text(
                      AppStrings.getGroceries(context),
                      style: TextStyles.font16WhiteRegularGilroyMedium,
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                      onPressed: () {
                        AppCubit.get(context).saveOnBoarding();
                        navigateTo(
                          context,
                          LoginScreen(),
                        );
                      },
                      title: AppStrings.getStarted(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
