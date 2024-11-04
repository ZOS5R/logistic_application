import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:lottie/lottie.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaSize.height(context) - 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 250.h,
              child: LottieBuilder.asset(
                'assets/animations/empty.json',
                repeat: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
