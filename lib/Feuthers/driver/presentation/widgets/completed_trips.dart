import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/trip_card/completed_trip_card.dart';
import 'package:logistic_app/core/style/text_style.dart';

class CompletedTripsScreen extends StatelessWidget {
  const CompletedTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.0.dg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today’s Completed',
              style: TextStyles.text_16(context),
            ),
            const CompletedTripCard(),
            const CompletedTripCard(),
            const CompletedTripCard(),
            const CompletedTripCard(),
            const CompletedTripCard(),
            const CompletedTripCard(),
          ],
        ),
      ),
    );
  }
}
