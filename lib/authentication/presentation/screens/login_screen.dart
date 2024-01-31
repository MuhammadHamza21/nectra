// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';

import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/authentication/presentation/widgets/alternative_sign_in_buttons.dart';
import 'package:nectar/authentication/presentation/widgets/do_not_have_account.dart';
import 'package:nectar/authentication/presentation/widgets/forgot_password_widget.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_text_button.dart';
import 'package:nectar/core/widgets/app_text_form_field.dart';
import 'package:nectar/core/widgets/circular_progress_indicator_widget.dart';
import 'package:nectar/core/widgets/snackbar_message.dart';
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
      body: Padding(
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
                verticalSpacing(50),
                Text(
                  AppStrings.login(context),
                  style: TextStyles.font26CanvasSemiBoldGolroy(context),
                ),
                verticalSpacing(10),
                Text(
                  AppStrings.enterEmailAndPassword(context),
                  style: TextStyles.font16GreyMediumGilroy,
                ),
                verticalSpacing(30),
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
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    final authCubit = AuthenticationCubit.get(context);
                    if (state is SignInWithEmailAndPasswordLoadingState) {
                      return const CircularProgressIndicatorWidget();
                    } else {
                      return AppTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus!.unfocus();
                            authCubit.signInWithEmailAndPassword(
                              SignInParams(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        title: AppStrings.login(context),
                      );
                    }
                  },
                  listener: (context, state) {
                    final authCubit = AuthenticationCubit.get(context);
                    if (state is SignInWithEmailAndPasswordOfflineState ||
                        state is SignInWithEmailAndPasswordErrorState) {
                      SnackbarMessage.showErrorMessage(
                          context, authCubit.userCredentialsMessage);
                    } else if (state
                        is SignInWithEmailAndPasswordSuccessState) {
                      SnackbarMessage.showSuccessMessage(
                        context,
                        "Logged in Successfully",
                      );
                    }
                  },
                ),
                verticalSpacing(20),
                Center(
                  child: Text(
                    AppStrings.connectWithSocialMedia(context),
                    style: TextStyles.font16GreyMediumGilroy,
                  ),
                ),
                verticalSpacing(15),
                const AlternativeSignInButtons(),
                verticalSpacing(25),
                const DonotHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
