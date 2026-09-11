import 'package:flutter/material.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class ResDMTextStyles {
  const ResDMTextStyles._();

  static const ResDMTextStyles _instance = ResDMTextStyles._();

  factory ResDMTextStyles() {
    return _instance;
  }

  // ===== 10 =====
  TextStyle get s10w400 => _tsDMSans(10, FontWeight.w400);
  TextStyle get s10w500 => _tsDMSans(10, FontWeight.w500);

  // ===== 12 =====
  TextStyle get s12w400 => _tsDMSans(12, FontWeight.w400);
  TextStyle get s12w500 => _tsDMSans(12, FontWeight.w500);
  TextStyle get s12w600 => _tsDMSans(12, FontWeight.w600);

  // ===== 14 =====
  TextStyle get s14w400 => _tsDMSans(14, FontWeight.w400);
  TextStyle get s14w500 => _tsDMSans(14, FontWeight.w500);
  TextStyle get s14w600 => _tsDMSans(14, FontWeight.w600);
  TextStyle get s14w700 => _tsDMSans(14, FontWeight.w700);

  // ===== 16 =====
  TextStyle get s16w400 => _tsDMSans(16, FontWeight.w400);
  TextStyle get s16w500 => _tsDMSans(16, FontWeight.w500);
  TextStyle get s16w600 => _tsDMSans(16, FontWeight.w600);
  TextStyle get s16w700 => _tsDMSans(16, FontWeight.w700);

  // ===== 18 =====
  TextStyle get s18w400 => _tsDMSans(18, FontWeight.w400);
  TextStyle get s18w500 => _tsDMSans(18, FontWeight.w500);
  TextStyle get s18w600 => _tsDMSans(18, FontWeight.w600);
  TextStyle get s18w700 => _tsDMSans(18, FontWeight.w700);

  // ===== 20 =====
  TextStyle get s20w400 => _tsDMSans(20, FontWeight.w400);
  TextStyle get s20w500 => _tsDMSans(20, FontWeight.w500);
  TextStyle get s20w600 => _tsDMSans(20, FontWeight.w600);
  TextStyle get s20w700 => _tsDMSans(20, FontWeight.w700);

  // ===== 24 =====
  TextStyle get s24w400 => _tsDMSans(24, FontWeight.w400);
  TextStyle get s24w500 => _tsDMSans(24, FontWeight.w500);
  TextStyle get s24w600 => _tsDMSans(24, FontWeight.w600);
  TextStyle get s24w700 => _tsDMSans(24, FontWeight.w700);

  // ===== 32 =====
  TextStyle get s32w400 => _tsDMSans(32, FontWeight.w400);
  TextStyle get s32w700 => _tsDMSans(32, FontWeight.w700);
}

TextStyle _tsDMSans(double size, FontWeight weight) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    fontFamily: 'NotoSansJP',
    decoration: TextDecoration.none,
    color: ResColors().textPrimary,
  );
}
