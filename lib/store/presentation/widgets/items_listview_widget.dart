import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/store/presentation/widgets/item_widget.dart';

class ItemsListViewWidget extends StatelessWidget {
  const ItemsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const ItemWidget(),
            );
          } else {
            return const ItemWidget();
          }
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
