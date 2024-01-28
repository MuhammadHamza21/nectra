import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/text_styles/app_font_weights.dart';

class TextStyles {
  static TextStyle font48WhiteRegularGilroy = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 48.sp,
    fontWeight: AppFontWeights.regular,
    height: 1,
    fontFamily: "Gilroy",
  );

  static TextStyle font16WhiteRegularGilroyMedium = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16.sp,
    fontWeight: AppFontWeights.regular,
    fontFamily: "Gilroy",
  );

  static TextStyle font18WhiteRegularGilroy = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16.sp,
    fontWeight: AppFontWeights.regular,
    fontFamily: "Gilroy",
  );

  static TextStyle font26CanvasSemiBoldGolroy(BuildContext context) =>
      TextStyle(
        fontSize: 26.sp,
        color: Theme.of(context).canvasColor,
        fontWeight: AppFontWeights.semiBold,
        fontFamily: "Gilroy",
      );

  static TextStyle font16GreyMediumGilroy = TextStyle(
    fontSize: 16.sp,
    color: AppColors.greyColor,
    fontWeight: AppFontWeights.medium,
    fontFamily: "Gilroy",
  );

  static TextStyle font18LighGreyMediumGilroy = TextStyle(
    fontSize: 18.sp,
    color: AppColors.lightGreyColor,
    fontWeight: AppFontWeights.medium,
    fontFamily: "Gilroy",
  );

  static TextStyle font18CanvasMediumGilroy(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        color: Theme.of(context).canvasColor,
        fontWeight: AppFontWeights.medium,
        fontFamily: "Gilroy",
      );

  static TextStyle font14CanvasMediumGilroy(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context).canvasColor,
        fontWeight: AppFontWeights.medium,
        fontFamily: "Gilroy",
      );

  static TextStyle font14GreenSemiBoldGilroy = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontWeight: AppFontWeights.semiBold,
    fontFamily: "Gilroy",
  );
}