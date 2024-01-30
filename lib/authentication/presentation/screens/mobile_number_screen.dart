import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_back_button.dart';
import 'package:nectar/core/widgets/app_phone_field.dart';
import 'package:nectar/core/widgets/spacing.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.enterYourMobileNumber(context),
              style: TextStyles.font26CanvasSemiBoldGolroy(context),
            ),
            verticalSpacing(25),
            AppPhoneField(
              hintText: AppStrings.enterYourMobile(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    );
  }
}
