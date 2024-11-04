import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/trip_card/info_row.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/trip_card/tag.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:logistic_app/core/style/text_style.dart';

class CurrentTripCard extends StatelessWidget {
  const CurrentTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 170.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: 'John',
                  child: Text(
                    'John Doe',
                    style: TextStyles.text_18(context).copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "${'dist'.tr()} 14 mi",
                  style: TextStyles.text_14(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            MediaSize.verticalSpce(20),
            const InfoRow(
              icon: Icons.location_on_outlined,
              text: '6391 Elgin St. Celina, Delaware 10299',
            ),
            MediaSize.verticalSpce(8),
            const InfoRow(
              icon: FontAwesomeIcons.boxOpen,
              text: 'Product -02',
            ),
            const Divider(thickness: 0.2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tag(text: 'WO# 04-1209'),
                Tag(text: '02', isLarge: true),
              ],
            )
          ],
        ),
      ),
    );
  }
}
