import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onTap,
    this.marginWidth = 25,
  });
  final Function() onTap;
  final double marginWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 51.57.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).shadowColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.symmetric(horizontal: marginWidth.w),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 25.sp,
              color: Theme.of(context).canvasColor,
            ),
            horizontalSpacing(10),
            Text(
              AppStrings.searchStore(context),
              style: TextStyles.font18DividerSemiboldGilroy(context)
                  .copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
