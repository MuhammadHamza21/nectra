import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlternativeSignInButton extends StatelessWidget {
  const AlternativeSignInButton({
    Key? key,
    required this.onPressed,
    required this.image,
  }) : super(key: key);

  final Function() onPressed;
  final String image;

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
        child: Image.asset("assets/images/${image}_logo.png"),
      ),
    );
  }
}
