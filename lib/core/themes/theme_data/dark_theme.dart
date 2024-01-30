import 'package:flutter/material.dart';
import 'package:nectar/core/themes/app_theme/app_bar_themes/app_bar_theme_dark.dart';
import 'package:nectar/core/themes/app_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:nectar/core/themes/app_theme/input_decoration/input_decoration_dark.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.blackColor,
  canvasColor: AppColors.whiteColor,
  inputDecorationTheme: inputDecorationThemeDark,
  splashColor: AppColors.lighterBlackColor,
  appBarTheme: appBarThemeDark,
  floatingActionButtonTheme: floatingActionButtonThemeData,
);
