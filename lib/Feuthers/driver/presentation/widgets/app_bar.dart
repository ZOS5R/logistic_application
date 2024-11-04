import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class DriverHomeAppBar extends StatelessWidget {
  const DriverHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${'Hello'.tr()} ${'John'}",
            style: TextStyles.text_18(context),
          ),
          Text(
            "4 ${1 == 2 ? 'trip_to_do'.tr() : 'trips_to_do'.tr()}",
            style: TextStyles.text_22(context)
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
