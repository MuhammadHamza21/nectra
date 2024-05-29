import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';

InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(19.r),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.lightGreyColor,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(19.r),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 191, 52, 42),
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(19.r),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(255, 191, 52, 42),
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(19.r),
  ),
);
