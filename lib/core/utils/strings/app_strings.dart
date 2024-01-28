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
  static String login(BuildContext context) =>
      getLangFromJson(context: context, text: "Login");
  static String enterEmailAndPassword(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterEmailAndPassword");
  static String enterYourEmail(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourEmail");
  static String emailMustNotBeEmpty(BuildContext context) =>
      getLangFromJson(context: context, text: "EmailMustNotBeEmpty");
  static String password(BuildContext context) =>
      getLangFromJson(context: context, text: "Password");
  static String enterYourPassword(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourPassword");
  static String passwordMustNotBeEmpty(BuildContext context) =>
      getLangFromJson(context: context, text: "PasswordMustNotBeEmpty");
  static String forgotPassword(BuildContext context) =>
      getLangFromJson(context: context, text: "ForgotPassword");
  static String donotHaveAccount(BuildContext context) =>
      getLangFromJson(context: context, text: "DonotHaveAccount");
  static String signUp(BuildContext context) =>
      getLangFromJson(context: context, text: "SignUp");
  static String email(BuildContext context) =>
      getLangFromJson(context: context, text: "Email");
}
