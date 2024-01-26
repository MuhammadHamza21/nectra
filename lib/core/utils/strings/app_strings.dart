import 'package:flutter/material.dart';
import 'package:nectar/core/utils/strings/get_lang_from_json.dart';

class AppStrings {
  static String getErrorMessage(BuildContext context, String message) =>
      getLangFromJson(context: context, text: message);
}
