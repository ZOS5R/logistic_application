import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class MediaSize {
  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static Size size(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static Widget verticalSpce(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  static Widget horizontalSpce(double width) {
    return SizedBox(
      width: width.w,
    );
  }
}
