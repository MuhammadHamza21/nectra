// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/authentication/presentation/screens/otp_code_screen.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/navigations/navigate_to.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_back_button.dart';
import 'package:nectar/core/widgets/app_phone_field.dart';
import 'package:nectar/core/widgets/circular_progress_indicator_widget.dart';
import 'package:nectar/core/widgets/snackbar_message.dart';
import 'package:nectar/core/widgets/spacing.dart';

class MobileNumberScreen extends StatelessWidget {
  MobileNumberScreen({super.key});
  var phoneController = TextEditingController();
  String phoneNumberWithCode = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.enterYourMobileNumber(context),
              style: TextStyles.font26CanvasSemiBoldGolroy(context),
            ),
            verticalSpacing(25),
            Form(
              key: formKey,
              child: AppPhoneField(
                hintText: AppStrings.enterYourMobile(context),
                controller: phoneController,
                onChanged: (phoneNumber) {
                  phoneNumberWithCode = phoneNumber.completeNumber;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          final authCubit = AuthenticationCubit.get(context);
          return FloatingActionButton(
            onPressed: () {
              if (state is! VerifyPhoneNumberLoadingState) {
                if (formKey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus!.unfocus();
                  authCubit.verifyPhoneNumber(phoneNumberWithCode);
                }
              }
            },
            child: state is VerifyPhoneNumberLoadingState
                ? CircularProgressIndicatorWidget(
                    color: AppColors.whiteColor,
                    verticalPadding: 20.h,
                    horizontalPadding: 20.h,
                    strokeWidth: 2,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
          );
        },
        listener: (context, state) {
          final authCubit = AuthenticationCubit.get(context);
          if (state is VerifyPhoneNumberOfflineState) {
            SnackbarMessage.showErrorMessage(
              context,
              authCubit.userCredentialsMessage,
            );
          } else if (state is VerifyPhoneNumberSuccessState) {
            navigateTo(
              context,
              OtpCodeScreen(
                phoneNumber: phoneNumberWithCode,
              ),
            );
          }
        },
      ),
    );
  }
}
