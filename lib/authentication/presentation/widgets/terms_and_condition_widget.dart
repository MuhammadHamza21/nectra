import 'package:flutter/material.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.byContinueYouAgree(context),
            style: TextStyles.font16GreyMediumGilroy,
          ),
          TextSpan(
            text: AppStrings.termsAndService(context),
            style: TextStyles.font16GreenMediumGilroy,
          ),
          TextSpan(
            text: AppStrings.and(context),
            style: TextStyles.font16GreyMediumGilroy.copyWith(
              height: 2,
            ),
          ),
          TextSpan(
            text: AppStrings.privacyPolicy(context),
            style: TextStyles.font16GreenMediumGilroy,
          ),
        ],
      ),
    );
  }
}
