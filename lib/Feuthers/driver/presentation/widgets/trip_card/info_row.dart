import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:logistic_app/core/style/text_style.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.dg),
        MediaSize.horizontalSpce(10),
        Text(text,
            style: TextStyles.text_12(context)
                .copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
