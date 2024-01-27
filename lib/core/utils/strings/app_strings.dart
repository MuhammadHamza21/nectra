import 'package:flutter/material.dart';
import 'package:nectar/core/utils/strings/get_lang_from_json.dart';

class AppStrings {
  static String getErrorMessage(BuildContext context, String message) =>
      getLangFromJson(context: context, text: message);
  static String welcomeToOurStore(BuildContext context) =>
      getLangFromJson(context: context, text: "WelcomeToOurStore");
  static String getGroceries(BuildContext context) =>
      getLangFromJson(context: context, text: "GetGroceries");
  static String getStarted(BuildContext context) =>
      getLangFromJson(context: context, text: "GetStarted");
}
