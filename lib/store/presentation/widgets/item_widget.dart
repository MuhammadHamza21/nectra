import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/text_styles/app_font_weights.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Theme.of(context).focusColor,
        ),
      ),
      height: 248.5.h,
      width: 173.3.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/felfel.png",
              height: 85.h,
              width: 97.w,
            ),
          ),
          verticalSpacing(20),
          Text(
            "Bell Pepper Red",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16CanvasBoldGilroy(context),
          ),
          verticalSpacing(5),
          Text(
            "1Kg, Price",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16GreyMediumGilroy.copyWith(
              fontSize: 14.sp,
            ),
          ),
          verticalSpacing(15),
          Row(
            children: [
              Expanded(
                child: Text(
                  "\$4.99",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font18CanvasMediumGilroy(context)
                      .copyWith(fontWeight: AppFontWeights.semiBold),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45.h,
                  width: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.r),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 25.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
