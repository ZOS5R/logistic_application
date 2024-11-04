import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/style/text_style.dart';

class DetailsRowWidget extends StatelessWidget {
  final String title;
  final String detail;
  const DetailsRowWidget({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr(),
              style: TextStyles.text_14(context)
                  .copyWith(fontWeight: FontWeight.bold)),
          Text(
            detail.tr(),
            style: TextStyles.text_14(context),
          ),
        ],
      ),
    );
  }
}
