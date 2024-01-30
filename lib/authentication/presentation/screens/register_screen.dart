// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/authentication/presentation/screens/mobile_number_screen.dart';
import 'package:nectar/authentication/presentation/widgets/already_have_an_account_text.dart';
import 'package:nectar/authentication/presentation/widgets/terms_and_condition_widget.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/app_text_form_field.dart';
import 'package:nectar/core/widgets/spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var isObsecureText = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("assets/images/logo_orange.png"),
                  ),
                  verticalSpacing(40),
                  Text(
                    AppStrings.signUp(context),
                    style: TextStyles.font26CanvasSemiBoldGolroy(context),
                  ),
                  verticalSpacing(15),
                  Text(
                    AppStrings.enterYourCredentials(context),
                    style: TextStyles.font16GreyMediumGilroy,
                  ),
                  verticalSpacing(30),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.username(context),
                          style: TextStyles.font16GreyMediumGilroy,
                        ),
                        verticalSpacing(10),
                        AppTextFormField(
                          controller: usernameController,
                          hintText: AppStrings.enterYourUsername(context),
                          autofillHints: const [AutofillHints.newUsername],
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: AppStrings.usernameMustNotBeEmpty(context),
                        ),
                        verticalSpacing(30),
                        Text(
                          AppStrings.email(context),
                          style: TextStyles.font16GreyMediumGilroy,
                        ),
                        verticalSpacing(10),
                        AppTextFormField(
                          controller: emailController,
                          hintText: AppStrings.enterYourEmail(context),
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: AppStrings.emailMustNotBeEmpty(context),
                        ),
                        verticalSpacing(30),
                        Text(
                          AppStrings.password(context),
                          style: TextStyles.font16GreyMediumGilroy,
                        ),
                        verticalSpacing(10),
                        AppTextFormField(
                          controller: passwordController,
                          hintText: AppStrings.enterYourPassword(context),
                          autofillHints: const [AutofillHints.newPassword],
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: AppStrings.passwordMustNotBeEmpty(context),
                          isObsecureText: isObsecureText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObsecureText = !isObsecureText;
                              });
                            },
                            child: Icon(
                              isObsecureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(20),
                  const TermsAndConditionsWidget(),
                  verticalSpacing(30),
                  AppTextButton(
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {}
                      navigateTo(
                        context,
                        const MobileNumberScreen(),
                      );
                    },
                    title: AppStrings.signUp(context),
                  ),
                  verticalSpacing(25),
                  const AlreadyHaveAnAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
