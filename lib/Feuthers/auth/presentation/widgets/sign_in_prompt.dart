import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?".tr(),
          style: TextStyles.text_14(context),
        ),
        InkWell(
          onTap: () {
            // context.push(RouteNames.signUp);
          },
          child: Text(
            'sign_up'.tr(),
            style: TextStyles.text_16(context).copyWith(
              letterSpacing: 1,
              shadows: const [
                Shadow(color: Colors.black, offset: Offset(0, 0)),
              ],
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
