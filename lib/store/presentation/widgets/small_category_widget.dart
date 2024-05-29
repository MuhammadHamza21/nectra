// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';

class SmallCategoryWidget extends StatelessWidget {
  const SmallCategoryWidget({
    super.key,
    required this.backgroundColor,
  });
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 105.h,
          width: 248.19.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: backgroundColor.withOpacity(.15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            children: [
              Image.asset(
                "assets/images/pulses.png",
                height: 72.h,
                width: 72.h,
              ),
              horizontalSpacing(15),
              Expanded(
                child: Text(
                  "Pulses",
                  style:
                      TextStyles.font26CanvasSemiBoldGolroy(context).copyWith(
                    fontSize: 20.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
