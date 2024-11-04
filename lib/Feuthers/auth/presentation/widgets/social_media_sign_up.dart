import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaSignUp extends StatelessWidget {
  const SocialMediaSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                indent: 20,
                color: Colors.black,
                thickness: 0.2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Or sign_up With",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Divider(
                endIndent: 20,
                color: Colors.black,
                thickness: 0.2,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 0.4),
            //     shape: BoxShape.circle,
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       SignUpConst.appleLogo,
            //       height: 25.h,
            //     ),
            //   ),
            // ),
            SizedBox(width: 10.w),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 0.4),
            //     shape: BoxShape.circle,
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       SignUpConst.googleLogo,
            //       height: 25.h,
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
