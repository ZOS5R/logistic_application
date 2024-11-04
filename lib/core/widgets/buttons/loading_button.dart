import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/helper/size.dart';
import 'package:logistic_app/core/style/text_style.dart';

class LoadingButton extends StatelessWidget {
  final String buttonText; // Button text
  final Future<dynamic>? Function()? onPressed; // Function to execute on press
  final bool isLoading; // External loading state

  const LoadingButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading, // Include the loading state
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: isLoading
            ? null
            : () async {
                if (onPressed == null) return;
                await onPressed!(); // Call the onPressed function passed from the constructor
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isLoading ? 58.w : MediaSize.width(context), // Circular width
          height: isLoading
              ? 58.w
              : 48.h, // Match height to width for circular shape
          decoration: BoxDecoration(
            color:
                isLoading ? Colors.grey : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(isLoading
                ? 29.w
                : 8), // Half of the width/height for circular shape
            boxShadow: isLoading
                ? []
                : [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
          ),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )
                : Text(buttonText.tr(),
                    style: TextStyles.text_16(context)
                        .copyWith(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
