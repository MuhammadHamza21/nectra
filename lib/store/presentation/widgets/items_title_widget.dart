import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/app_font_weights.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';

class ItemsTitleWidget extends StatelessWidget {
  const ItemsTitleWidget({
    super.key,
    required this.title,
    required this.onSeeAllTapped,
  });
  final String title;
  final Function() onSeeAllTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.font26CanvasSemiBoldGolroy(context)
                .copyWith(fontSize: 24.sp),
          ),
          RichText(
            text: TextSpan(
              text: AppStrings.seeAll(context),
              style: TextStyles.font16GreenMediumGilroy
                  .copyWith(fontWeight: AppFontWeights.semiBold),
              recognizer: TapGestureRecognizer()..onTap = onSeeAllTapped,
            ),
          ),
        ],
      ),
    );
  }
}
