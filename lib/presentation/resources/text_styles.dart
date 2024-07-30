import 'package:flutter/material.dart';

import 'package:test_part/presentation/resources/theme.dart';

extension AppFontWeight on FontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

abstract final class AppTextStyles {
  static heading1({Color? color}) => TextStyle(
    fontSize: 32,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.bold,
  );

  static heading2({Color? color}) => TextStyle(
    fontSize: 28,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.bold,
  );

  static heading3({Color? color}) => TextStyle(
    fontSize: 24,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodyXLarge({Color? color}) => TextStyle(
    fontSize: 20,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodyXLargeBold({Color? color}) => TextStyle(
    fontSize: 20,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.bold,
  );

  static bodyLarge({Color? color}) => TextStyle(
    fontSize: 18,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodyLargeRegular({Color? color}) => TextStyle(
    fontSize: 18,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.regular,
  );

  static bodyNormalBold({Color? color}) => TextStyle(
    fontSize: 16,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.bold,
  );

  static bodyNormalMedium({Color? color}) => TextStyle(
    fontSize: 16,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodyNormalRegular({Color? color}) => TextStyle(
    fontSize: 16,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.regular,
  );

  static bodySmallBold({Color? color}) => TextStyle(
    fontSize: 14,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.bold,
  );

  static bodySmallMedium({Color? color}) => TextStyle(
    fontSize: 14,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodySmallRegular({Color? color}) => TextStyle(
    fontSize: 14,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.regular,
  );

  static bodyXSmallMedium({Color? color}) => TextStyle(
    fontSize: 12,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.medium,
  );

  static bodyXSmallRegular({Color? color}) => TextStyle(
    fontSize: 12,
    color: color ?? AppColors.neutral,
    fontFamily: 'Manrope',
    fontWeight: AppFontWeight.regular,
  );
}
