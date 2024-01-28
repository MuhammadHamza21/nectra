import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: RichText(
        text: TextSpan(
          text: AppStrings.forgotPassword(context),
          style: TextStyles.font14CanvasMediumGilroy(context),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              navigateTo(
                context,
                const ForgotPasswordScreen(),
              );
            },
        ),
      ),
    );
  }
}
