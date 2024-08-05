// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nectar/authentication/presentation/controller/authentication_cubit.dart';
import 'package:nectar/authentication/presentation/widgets/otp_field_widget.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/app_back_button.dart';
import 'package:nectar/core/widgets/circular_progress_indicator_widget.dart';
import 'package:nectar/core/widgets/snackbar_message.dart';
import 'package:nectar/core/widgets/spacing.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;
  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.enterOTPCode(context),
              style: TextStyles.font26CanvasSemiBoldGolroy(context),
            ),
            verticalSpacing(28),
            OtpFieldWidget(
              controller: otpController,
              onCodeChanged: (p0) {
                if (p0!.length == 6) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                  text: AppStrings.resendCode(context),
                  style: TextStyles.font18GreenMediumGilroy,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AuthenticationCubit.get(context)
                          .verifyPhoneNumber(phoneNumber);
                    }),
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is! VerifyCodeLoadingState) {
                AuthenticationCubit.get(context).verifyCode(otpController.text);
              }
            },
            child: state is VerifyCodeLoadingState
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
          if (state is VerifyCodeErrorState ||
              state is VerifyCodeOfflineState) {
            final authCubit = AuthenticationCubit.get(context);
            SnackbarMessage.showErrorMessage(
              context,
              authCubit.userCredentialsMessage,
            );
          } else if (state is VerifyCodeSuccessState) {}
        },
      ),
    );
  }
}
