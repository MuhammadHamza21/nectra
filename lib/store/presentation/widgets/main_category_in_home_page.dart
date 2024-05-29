import 'package:flutter/material.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/presentation/widgets/items_listview_widget.dart';
import 'package:nectar/store/presentation/widgets/items_title_widget.dart';
import 'package:nectar/store/presentation/widgets/small_category_listview_widget.dart';

class MainCategoryInHomePage extends StatelessWidget {
  const MainCategoryInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitleWidget(
          title: AppStrings.groceries(context),
          onSeeAllTapped: () {},
        ),
        verticalSpacing(20),
        const SmallCategoryListviewWidget(),
        verticalSpacing(20),
        const ItemsListViewWidget(),
      ],
    );
  }
}
