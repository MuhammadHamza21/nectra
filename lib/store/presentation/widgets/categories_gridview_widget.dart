// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/store/presentation/widgets/category_widget.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  const CategoriesGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        15,
        (index) {
          return CategoryWidget(
            backgroundColor: AppColors.categoryColorsList[
                index % AppColors.categoryColorsList.length],
          );
        },
      ),
    );
  }
}
