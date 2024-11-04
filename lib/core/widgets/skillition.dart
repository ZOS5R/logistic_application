import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Skillition extends StatelessWidget {
  final int height;
  final int width;
  final BorderRadius borderRadius; // Accept BorderRadius parameter

  const Skillition({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(8)), // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    // Detect the current theme (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Define shimmer colors for light and dark modes
    Color baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[400]!;
    Color highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width.toDouble().w,
        height: height.toDouble().h,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: borderRadius, // Use the BorderRadius parameter
        ),
      ),
    );
  }
}
