import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.tr(),
        style: TextStyles.text_18(context),
      ),
      content: Text(
        content.tr(),
        style: TextStyles.text_14(context),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            'cancel'.tr(),
            style: TextStyles.text_16(context),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'confirm'.tr(),
            style: TextStyles.text_16(context),
          ),
        ),
      ],
    );
  }
}
