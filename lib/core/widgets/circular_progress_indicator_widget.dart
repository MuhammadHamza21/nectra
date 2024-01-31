import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({
    Key? key,
    this.verticalPadding,
  }) : super(key: key);

  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 13.h),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
