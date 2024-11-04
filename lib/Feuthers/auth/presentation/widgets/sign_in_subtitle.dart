import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class SignInSubtitle extends StatelessWidget {
  const SignInSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "hi_welcome_back_youve_been_missed".tr(),
      style: TextStyles.text_14(context),
      textAlign: TextAlign.center,
    );
  }
}
