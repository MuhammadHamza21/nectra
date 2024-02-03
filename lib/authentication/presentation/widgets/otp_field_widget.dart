import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpFieldWidget extends StatelessWidget {
  const OtpFieldWidget({
    super.key,
    required this.controller,
    this.onCodeChanged,
    this.onCodeSubmitted,
  });
  final TextEditingController controller;
  final Function(String?)? onCodeChanged;
  final Function(String)? onCodeSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: PinFieldAutoFill(
        controller: controller,
        codeLength: 6,
        decoration: BoxLooseDecoration(
          textStyle: TextStyles.font18CanvasMediumGilroy(context),
          strokeColorBuilder: const FixedColorBuilder(AppColors.primaryColor),
          radius: const Radius.circular(16),
          gapSpace: 10.w,
          bgColorBuilder: const FixedColorBuilder(
            Color(0xFFFDFDFF),
          ),
          hintText: "______",
          hintTextStyle: TextStyles.font18LighGreyMediumGilroy,
        ),
        onCodeChanged: onCodeChanged,
        onCodeSubmitted: onCodeSubmitted,
      ),
    );
  }
}
