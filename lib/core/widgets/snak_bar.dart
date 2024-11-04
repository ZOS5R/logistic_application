import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class SnackbarHelper {
  static void showSnackbar({
    required BuildContext context,
    String? title,
    required String content,
    required SnackbarState state,
    SnackBarAction? actionWidget,
    Duration duration = const Duration(seconds: 3), // Custom duration
    Color? textColor,
    Color? actionColor,
    Icon? icon,
  }) {
    final Color backgroundColor = _getBackgroundColor(state);
    final Color lineColor =
        backgroundColor; // Line color matches Snackbar background

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      content: Row(
        children: [
          // Vertical line on the left
          Container(
            width: 10, // Line width
            height: 50, // Adjust height based on your design
            color: lineColor,
          ),
          const SizedBox(width: 8), // Space between line and content
          // Icon on the left with shadow effect
          if (icon != null) ...[
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for shadow effect
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: icon,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(title.tr(),
                      style: TextStyles.text_16(context)
                          .copyWith(color: Colors.white)),
                const SizedBox(height: 5),
                Text(
                  content.tr(),
                  style:
                      TextStyles.text_14(context).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      duration: duration,
      action: actionWidget ??
          SnackBarAction(
            label: 'dismiss'.tr(),
            textColor: actionColor ?? Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    Future.delayed(
        Duration.zero,
        // ignore: use_build_context_synchronously
        () => ScaffoldMessenger.of(context).showSnackBar(snackbar));
  }

  static Color _getBackgroundColor(SnackbarState state) {
    switch (state) {
      case SnackbarState.success:
        return Colors.green;
      case SnackbarState.error:
        return Colors.red;
      case SnackbarState.warning:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}

enum SnackbarState {
  success,
  error,
  warning,
}
