import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).colorScheme.brightness == Brightness.dark
    //     ? Colors.white
    //     : Colors.black;
    return IconButton(
      icon: Center(
          child: Icon(
        Icons.arrow_back_ios_sharp,
        color: Colors.white,
        size: 20.r,
      )),
      onPressed: () {
        context.pop();
      },
    );
  }
}
