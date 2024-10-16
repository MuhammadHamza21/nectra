// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:nectar/core/themes/colors/app_colors.dart';
import 'package:nectar/core/utils/text_styles/text_styles.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/presentation/widgets/item_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.blackColor,
            size: 22.sp,
          ),
        ),
        title: Text(
          widget.category.nameEn,
          style: TextStyles.font16CanvasBoldGilroy(context).copyWith(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.sliders,
              size: 22.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.25,
          mainAxisSpacing: 15.h,
          children: List.generate(
            25,
            (index) => const ItemWidget(),
          ),
        ),
      ),
    );
  }
}
