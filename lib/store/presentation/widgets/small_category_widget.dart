// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/domain/entities/category.dart';

class SmallCategoryWidget extends StatelessWidget {
  const SmallCategoryWidget({
    super.key,
    required this.backgroundColor,
    required this.category,
  });
  final Color backgroundColor;
  final Category category;

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
              Image.network(
                category.image,
                height: 72.h,
                width: 72.h,
              ),
              horizontalSpacing(15),
              Expanded(
                child: Text(
                  category.nameEn,
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
