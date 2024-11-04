import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIcon extends StatelessWidget {
  final Icon icon;

  const LoadingIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[700]!
          : Colors.grey[300]!,
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[500]!
          : Colors.grey[200]!, // Adjusted highlight color for better contrast
      child: Container(
        child: icon,
      ),
    );
  }
}
