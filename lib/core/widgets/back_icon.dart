import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return IconButton(
      icon: Container(
          padding: EdgeInsets.all(4.dg),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 0.3, color: color),
          ),
          child: Center(
              child: Icon(
            Icons.arrow_back_rounded,
            color: color,
            size: 20.r,
          ))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
