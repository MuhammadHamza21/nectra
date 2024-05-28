// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/strings/app_strings.dart';

import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:nectar/store/presentation/widgets/carousel_slider.dart';
import 'package:nectar/store/presentation/widgets/item_widget.dart';
import 'package:nectar/store/presentation/widgets/items_title_widget.dart';
import 'package:nectar/store/presentation/widgets/search_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpacing(20),
        Image(
          image: const AssetImage(
            "assets/images/logo_orange.png",
          ),
          height: 30.8.h,
          width: 26.48.w,
        ),
        verticalSpacing(20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_rounded,
              size: 25.sp,
              color: Theme.of(context).dividerColor,
            ),
            horizontalSpacing(5),
            Text(
              "Giza, Egypt",
              style: TextStyles.font18DividerSemiboldGilroy(context),
            ),
          ],
        ),
        verticalSpacing(20),
        SearchWidget(
          onTap: () {},
        ),
        verticalSpacing(30),
        const CarouselSliderWidget(
          images: [
            "assets/images/banner.png",
            "assets/images/banner.png",
            "assets/images/banner.png",
          ],
        ),
        verticalSpacing(30),
        ItemsTitleWidget(
          title: AppStrings.exclusiveOffers(context),
          onSeeAllTapped: () {},
        ),
        verticalSpacing(20),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const ItemWidget();
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
