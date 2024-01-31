// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nectar/authentication/presentation/widgets/alternative_sign_in_button.dart';
import 'package:nectar/core/widgets/spacing.dart';
import 'package:ionicons/ionicons.dart';

class AlternativeSignInButtons extends StatelessWidget {
  const AlternativeSignInButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlternativeSignInButton(
          onPressed: () {},
          icon: Ionicons.logo_google,
          iconColor: Colors.red,
        ),
        horizontalSpacing(25),
        AlternativeSignInButton(
          onPressed: () {},
          icon: Ionicons.logo_facebook,
          iconColor: Colors.blue,
        ),
      ],
    );
  }
}
