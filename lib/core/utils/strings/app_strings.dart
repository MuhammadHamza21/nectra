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
  static String connectWithSocialMedia(BuildContext context) =>
      getLangFromJson(context: context, text: "ConnectWithSocialMedia");
  static String enterYourCredentials(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourCredentials");
  static String username(BuildContext context) =>
      getLangFromJson(context: context, text: "Username");
  static String enterYourUsername(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourUsername");
  static String usernameMustNotBeEmpty(BuildContext context) =>
      getLangFromJson(context: context, text: "UsernameMustNotBeEmpty");
  static String byContinueYouAgree(BuildContext context) =>
      getLangFromJson(context: context, text: "ByContinueYouAgree");
  static String termsAndService(BuildContext context) =>
      getLangFromJson(context: context, text: "TermsAndService");
  static String and(BuildContext context) =>
      getLangFromJson(context: context, text: "And");
  static String privacyPolicy(BuildContext context) =>
      getLangFromJson(context: context, text: "PrivacyPolicy");
  static String alreadyHaveAnAccount(BuildContext context) =>
      getLangFromJson(context: context, text: "AlreadyHaveAnAccount");
  static String signIn(BuildContext context) =>
      getLangFromJson(context: context, text: "SignIn");
  static String enterYourMobileNumber(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourMobileNumber");
  static String enterYourMobile(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterYourMobile");
  static String enterOTPCode(BuildContext context) =>
      getLangFromJson(context: context, text: "EnterOTPCode");
  static String resendCode(BuildContext context) =>
      getLangFromJson(context: context, text: "ResendCode");
  static String loggedInSuccess(BuildContext context) =>
      getLangFromJson(context: context, text: "LoggedInSuccess");
  static String shop(BuildContext context) =>
      getLangFromJson(context: context, text: "Shop");
  static String explore(BuildContext context) =>
      getLangFromJson(context: context, text: "Explore");
  static String cart(BuildContext context) =>
      getLangFromJson(context: context, text: "Cart");
  static String favourites(BuildContext context) =>
      getLangFromJson(context: context, text: "Favourites");
  static String account(BuildContext context) =>
      getLangFromJson(context: context, text: "Account");
  static String searchStore(BuildContext context) =>
      getLangFromJson(context: context, text: "SearchStore");
  static String seeAll(BuildContext context) =>
      getLangFromJson(context: context, text: "SeeAll");
  static String exclusiveOffers(BuildContext context) =>
      getLangFromJson(context: context, text: "ExclusiveOffers");
  static String bestSelling(BuildContext context) =>
      getLangFromJson(context: context, text: "BestSelling");
  static String groceries(BuildContext context) =>
      getLangFromJson(context: context, text: "Groceries");
  static String signOut(BuildContext context) =>
      getLangFromJson(context: context, text: "SignOut");
}
