// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/presentation/widgets/items_listview_widget.dart';
import 'package:nectar/store/presentation/widgets/items_title_widget.dart';

class ItemsListviewWithTitleWidget extends StatelessWidget {
  const ItemsListviewWithTitleWidget({
    super.key,
    required this.title,
    required this.onSeeAllTapped,
    required this.items,
  });
  final String title;
  final Function() onSeeAllTapped;
  final List items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitleWidget(
          title: title,
          onSeeAllTapped: onSeeAllTapped,
        ),
        verticalSpacing(20),
        const ItemsListViewWidget(),
      ],
    );
  }
}
