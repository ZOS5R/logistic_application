import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:logistic_app/core/style/text_style.dart';

class Tag extends StatelessWidget {
  final String text;
  final bool isLarge;

  const Tag({super.key, required this.text, this.isLarge = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        text,
        style: isLarge
            ? TextStyles.text_18(context).copyWith(color: Colors.white)
            : TextStyles.text_12(context).copyWith(color: Colors.white),
      ),
    );
  }
}
