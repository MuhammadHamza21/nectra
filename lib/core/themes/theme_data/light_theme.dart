import 'package:flutter/material.dart';
import 'package:nectar/core/themes/app_theme/app_bar_themes/app_bar_theme_light.dart';
import 'package:nectar/core/themes/app_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:nectar/core/themes/app_theme/input_decoration/input_decoration_light.dart';
import 'package:nectar/core/themes/app_theme/progress_indicator_theme/progress_indicatot_theme.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  canvasColor: AppColors.blackColor,
  inputDecorationTheme: inputDecorationThemeLight,
  splashColor: AppColors.moreLighterGrey,
  appBarTheme: appBarThemeLight,
  floatingActionButtonTheme: floatingActionButtonThemeData,
  progressIndicatorTheme: progressIndicatorThemeData,
);
