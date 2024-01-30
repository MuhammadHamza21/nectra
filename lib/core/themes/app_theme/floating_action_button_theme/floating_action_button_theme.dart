import 'package:flutter/material.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';

FloatingActionButtonThemeData floatingActionButtonThemeData =
    const FloatingActionButtonThemeData(
  backgroundColor: AppColors.primaryColor,
  shape: CircleBorder(),
  foregroundColor: AppColors.whiteColor,
);
/*
FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.whiteColor,
        ),
      ),
 */