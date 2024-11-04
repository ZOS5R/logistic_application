import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/order_details/order_details_card.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/product/product_card.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:logistic_app/core/router/rotue_names.dart';
import 'package:logistic_app/core/style/text_style.dart';
import 'package:logistic_app/core/widgets/back_icon.dart';
import 'package:logistic_app/core/widgets/buttons/button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackIcon(),
        title: Text(
          'order_details'.tr(),
          style: TextStyles.text_20(context)
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.dg),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const OrderDetailsCard(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              'Delivery Requests ',
              style: TextStyles.text_16(context),
            ),
          ),
          const ProductCard(),
        ]),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.dg),
            child: CustomButton(
              text: 'View Map',
              onPressed: () {
                context.push(RouteNames.googleMap);
              },
            ),
          ),
          MediaSize.verticalSpce(40),
        ],
      ),
    );
  }
}
