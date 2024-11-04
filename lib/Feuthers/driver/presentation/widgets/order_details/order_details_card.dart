import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/order_details/main_details.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/trip_card/info_row.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:logistic_app/core/style/text_style.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.dg),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]),
      height: 175.h,
      child: Column(
        children: [
          const MainOrderDetails(
            name: 'John',
            distance: '14',
          ),
          MediaSize.verticalSpce(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InfoRow(
                icon: Icons.location_on_outlined,
                text: '6391 Elgin St. Celina, Delaware 10299',
              ),
              Stack(
                children: [
                  Transform.rotate(
                    angle: 45 * 3.14159265359 / 180,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    top: 0,
                    child: Icon(
                      Icons.turn_right,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ],
              )
            ],
          ),
          MediaSize.verticalSpce(8),
          const InfoRow(
            icon: FontAwesomeIcons.boxOpen,
            text: 'Product -02',
          ),
          const Divider(thickness: 0.2),
          Row(
            children: [
              Icon(
                Icons.local_phone_outlined,
                size: 32.r,
              ),
              MediaSize.horizontalSpce(4),
              Text(
                'Call_Customer'.tr(),
                style: TextStyles.text_14(context)
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
