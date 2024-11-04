import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class MainOrderDetails extends StatelessWidget {
  final String name;
  final String distance;
  const MainOrderDetails(
      {super.key, required this.distance, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: name,
            child: Text(
              'John Doe',
              style: TextStyles.text_18(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Hero(
            tag: distance,
            child: Text(
              "${'dist'.tr()} 14 mi",
              style: TextStyles.text_14(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
