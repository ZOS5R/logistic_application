import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/style/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double elevation;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Widget? additionalWidget;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.elevation = 2.0,
    this.borderRadius = 12.0,
    this.textStyle,
    this.padding,
    this.additionalWidget,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (textStyle == null) {
      style = TextStyles.text_16(context)
          .copyWith(color: Theme.of(context).textTheme.bodyLarge!.color);
    } else {
      style = textStyle!
          .copyWith(color: Theme.of(context).textTheme.bodyLarge!.color);
    }
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: additionalWidget != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text.tr(), style: style),
                    additionalWidget!,
                  ],
                )
              : Text(text.tr(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle ?? style),
        ));
  }
}
