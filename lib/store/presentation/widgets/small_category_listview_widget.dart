// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/presentation/widgets/small_category_widget.dart';

class SmallCategoryListviewWidget extends StatelessWidget {
  const SmallCategoryListviewWidget({
    super.key,
    required this.categoriesList,
  });
  final List<Category> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SmallCategoryWidget(
                    backgroundColor: AppColors.categoryColorsList[
                        index % AppColors.categoryColorsList.length],
                    category: categoriesList[index],
                  ),
                )
              : SmallCategoryWidget(
                  backgroundColor: AppColors.categoryColorsList[
                      index % AppColors.categoryColorsList.length],
                  category: categoriesList[index]);
        },
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
