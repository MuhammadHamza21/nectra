import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

BottomNavigationBarThemeData darkBottomNavigationBarThemeData =
    BottomNavigationBarThemeData(
  elevation: 8,
  backgroundColor: AppColors.blackColor,
  type: BottomNavigationBarType.fixed,
  selectedIconTheme: IconThemeData(
    color: AppColors.primaryColor,
    size: 25.sp,
  ),
  unselectedIconTheme: IconThemeData(
    color: AppColors.whiteColor,
    size: 25.sp,
  ),
  unselectedLabelStyle: TextStyles.font12GreenSemiboldGilroy
      .copyWith(color: AppColors.whiteColor),
  selectedLabelStyle: TextStyles.font12GreenSemiboldGilroy,
  selectedItemColor: AppColors.primaryColor,
  unselectedItemColor: AppColors.whiteColor,
);
