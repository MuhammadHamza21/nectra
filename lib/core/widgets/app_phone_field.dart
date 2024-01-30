// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObsecureText,
    this.suffixIcon,
    this.controller,
    this.textInputAction,
    this.autofillHints,
    this.validateText,
  });

  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final String? validateText;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      validator: (p0) {
        if (p0!.number.isEmpty) {
          return validateText;
        }
        return null;
      },
      initialCountryCode: 'EG',
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        // focusedBorder: focusedBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(
        //         color: AppColors.primaryColor,
        //         width: 1.3,
        //       ),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        // enabledBorder: enabledBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(
        //         color: AppColors.lighterGrey,
        //         width: 1.3,
        //       ),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.red,
        //     width: 1.3,
        //   ),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: AppColors.primaryColor,
        //     width: 1.3,
        //   ),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        hintStyle: hintStyle ?? TextStyles.font18LighGreyMediumGilroy,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      languageCode: "en",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }
}
