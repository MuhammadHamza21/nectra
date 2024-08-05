import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar/authentication/presentation/screens/register_screen.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.donotHaveAccount(context),
            style: TextStyles.font14CanvasMediumGilroy(context),
          ),
          TextSpan(
            text: AppStrings.signUp(context),
            style: TextStyles.font14GreenSemiBoldGilroy,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                navigateTo(
                  context,
                  const RegisterScreen(),
                );
              },
          ),
        ],
      )),
    );
  }
}
