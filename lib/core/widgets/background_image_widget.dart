// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/mask_group.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
