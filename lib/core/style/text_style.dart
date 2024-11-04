import 'package:easy_localization/easy_localization.dart'; // Assuming you're using Easy Localization
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle getTextStyle(BuildContext context, double size,
      {FontWeight? weight}) {
    String currentLang =
        context.locale.languageCode; // Get current language code

    if (currentLang == 'ar') {
      // Arabic styles
      return TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily, // Use Cairo for Arabic
        fontSize: size.sp,
        fontWeight: weight ?? FontWeight.normal,
      );
    } else if (currentLang == 'zh-Hans') {
      // Simplified Chinese styles
      return TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: size.sp,
        fontWeight: weight ?? FontWeight.normal,
        // Additional Chinese specific styles
      );
    } else if (currentLang == 'zh-Hant') {
      // Traditional Chinese styles
      return TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: size.sp,
        fontWeight: weight ?? FontWeight.normal,
        // Additional Chinese specific styles
      );
    } else {
      // Default styles
      return TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: size.sp,
        fontWeight: weight ?? FontWeight.normal,
      );
    }
  }

  static TextStyle text_10(BuildContext context) => getTextStyle(context, 10);
  static TextStyle text_12(BuildContext context) => getTextStyle(context, 12);
  static TextStyle text_14(BuildContext context) => getTextStyle(context, 14);
  static TextStyle text_16(BuildContext context) => getTextStyle(context, 16);
  static TextStyle text_18(BuildContext context) => getTextStyle(context, 18);
  static TextStyle text_20(BuildContext context) => getTextStyle(context, 20);
  static TextStyle text_22(BuildContext context) => getTextStyle(context, 22);
  static TextStyle text_24(BuildContext context) => getTextStyle(context, 24);
  static TextStyle text_26(BuildContext context) => getTextStyle(context, 26);
  static TextStyle text_28(BuildContext context) => getTextStyle(context, 28);
  static TextStyle text_30(BuildContext context) => getTextStyle(context, 30);
  static TextStyle text_32(BuildContext context) => getTextStyle(context, 32);
  static TextStyle text_34(BuildContext context) => getTextStyle(context, 34);
}
