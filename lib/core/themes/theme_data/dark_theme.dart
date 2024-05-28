import 'package:flutter/material.dart';
import 'package:nectar/core/themes/app_theme/app_bar_themes/app_bar_theme_dark.dart';
import 'package:nectar/core/themes/app_theme/bottom_navigation_bar_themes/dark_bottom_navigation_bar_theme.dart';
import 'package:nectar/core/themes/app_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:nectar/core/themes/app_theme/input_decoration/input_decoration_dark.dart';
import 'package:nectar/core/themes/app_theme/progress_indicator_theme/progress_indicatot_theme.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.blackColor,
  primaryColor: AppColors.primaryColor,
  canvasColor: AppColors.whiteColor,
  inputDecorationTheme: inputDecorationThemeDark,
  splashColor: AppColors.lighterBlackColor,
  appBarTheme: appBarThemeDark,
  floatingActionButtonTheme: floatingActionButtonThemeData,
  progressIndicatorTheme: progressIndicatorThemeData,
  bottomNavigationBarTheme: darkBottomNavigationBarThemeData,
  dividerColor: AppColors.moreLighterGrey,
  shadowColor: AppColors.lighterBlackColor,
  focusColor: AppColors.lighterBlackColor,
);
