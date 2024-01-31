// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlternativeSignInButton extends StatelessWidget {
  const AlternativeSignInButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  final Function() onPressed;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 46.h,
        width: 46.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).splashColor,
        ),
        child: Icon(
          icon,
          color: iconColor ?? Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
