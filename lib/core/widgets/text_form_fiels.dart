import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/core/style/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function()? onSuffixIconTap;
  final void Function(String)? onChanged;
  final String? initialValue;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Widget additionalWidget;
  final Color? borderColor;
  final Color? fillColor;
  final bool isDisabled;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? padding;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.padding,
    this.keyboardType,
    this.additionalWidget = const SizedBox(),
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSuffixIconTap,
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.textInputAction,
    this.borderColor, // Accept color in constructor
    this.fillColor, // Accept fill color in constructor
    this.isDisabled = false, // Default to false
    this.minLines, // Accept minLines in constructor
    this.maxLines, // Accept maxLines in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 4.0),
          child: additionalWidget,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0.h),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            readOnly: readOnly || isDisabled, // Make readOnly if disabled
            textInputAction: textInputAction,
            validator: validator,
            onChanged: isDisabled
                ? null
                : onChanged, // Disable onChanged if isDisabled
            minLines: minLines, // Set minimum lines
            maxLines: maxLines ?? 1, // Set maximum lines, default to 1
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              hintStyle: TextStyles.text_14(context).copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.4),
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon != null
                  ? GestureDetector(
                      onTap: isDisabled
                          ? null
                          : onSuffixIconTap, // Disable icon tap if isDisabled
                      child: Icon(suffixIcon),
                    )
                  : null,
              fillColor: fillColor ??
                  Theme.of(context)
                      .colorScheme
                      .secondary, // Use provided fill color
              filled: fillColor != null, // Only fill if fillColor is not null
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
