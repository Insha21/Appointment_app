import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  // Regular text
  static const regular = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400, // Regular
    fontStyle: FontStyle.normal,
    color: AppColors.textDark,
    fontSize: 16,
  );

  // SemiBold Italic (for emphasis)
  static const semiBoldItalic = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600, // SemiBold
    fontStyle: FontStyle.italic,
    color: AppColors.textDark,
    fontSize: 16,
  );

  // Heading
  static const heading = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic, // SemiBold Italic
    fontSize: 22,
    color: AppColors.primary,
  );

  // Subtitle
  static final subtitle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400, // Regular
    fontSize: 14,
    color: AppColors.textLight,
  );

  // Small text
  static final small = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12,
    color: AppColors.textLight,
  );
}
