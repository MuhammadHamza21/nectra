// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/authentication/presentation/widgets/do_not_have_account.dart';
import 'package:nectar/authentication/presentation/widgets/forgot_password_widget.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/app_text_form_field.dart';
import 'package:nectar/core/widgets/background_image_widget.dart';
import 'package:nectar/core/widgets/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo_orange.png",
                    ),
                  ),
                  verticalSpacing(100),
                  Text(
                    AppStrings.login(context),
                    style: TextStyles.font26CanvasSemiBoldGolroy(context),
                  ),
                  verticalSpacing(15),
                  Text(
                    AppStrings.enterEmailAndPassword(context),
                    style: TextStyles.font16GreyMediumGilroy,
                  ),
                  verticalSpacing(40),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          autofillHints: const [AutofillHints.password],
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
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
                          onFieldSubmitted: (p0) {},
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(20),
                  const ForgotPasswordWidget(),
                  verticalSpacing(30),
                  AppTextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    title: AppStrings.login(context),
                  ),
                  verticalSpacing(25),
                  const DonotHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
