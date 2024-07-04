// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/domain/entities/category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.backgroundColor,
    required this.category,
  });
  final Color backgroundColor;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: 175.w,
      margin: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 7.5.h),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(.10),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: backgroundColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(category.image),
              ),
            ),
            height: 75.h,
            width: 111.w,
            clipBehavior: Clip.antiAlias,
          ),
          verticalSpacing(20),
          Text(
            category.nameEn,
            style: TextStyles.font16CanvasBoldGilroy(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
