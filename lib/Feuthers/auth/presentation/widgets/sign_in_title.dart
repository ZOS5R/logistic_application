import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sign In'.tr(),
        style: TextStyles.text_30(context)
            .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1),
      ),
    );
  }
}
