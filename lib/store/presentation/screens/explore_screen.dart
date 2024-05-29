import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/presentation/widgets/categories_gridview_widget.dart';
import 'package:nectar/store/presentation/widgets/search_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacing(20),
            Text(
              "Find Products",
              style: TextStyles.font16CanvasBoldGilroy(context).copyWith(
                fontSize: 20.sp,
              ),
            ),
            verticalSpacing(20),
            SearchWidget(
              onTap: () {},
              marginWidth: 0,
            ),
            verticalSpacing(20),
            CategoriesGridViewWidget(),
            verticalSpacing(20),
          ],
        ),
      ),
    );
  }
}
