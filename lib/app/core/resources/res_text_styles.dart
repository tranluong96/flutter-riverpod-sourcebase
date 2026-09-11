import 'package:flutter/material.dart';
import 'package:myapp/app/core/resources/res_colors.dart';

class ResTextStyles {
  const ResTextStyles._();

  static const ResTextStyles _instance = ResTextStyles._();

  factory ResTextStyles() {
    return _instance;
  }

  // ===== 10 =====
  TextStyle get s10w400 => _tsNotoSans(10, FontWeight.w400);
  TextStyle get s10w500 => _tsNotoSans(10, FontWeight.w500);

  // ===== 12 =====
  TextStyle get s12w400 => _tsNotoSans(12, FontWeight.w400);
  TextStyle get s12w500 => _tsNotoSans(12, FontWeight.w500);
  TextStyle get s12w600 => _tsNotoSans(12, FontWeight.w600);
  TextStyle get s12w700 => _tsNotoSans(12, FontWeight.w700);

  // ===== 14 =====
  TextStyle get s14w400 => _tsNotoSans(14, FontWeight.w400);
  TextStyle get s14w500 => _tsNotoSans(14, FontWeight.w500);
  TextStyle get s14w600 => _tsNotoSans(14, FontWeight.w600);
  TextStyle get s14w700 => _tsNotoSans(14, FontWeight.w700);

  // ===== 16 =====
  TextStyle get s16w400 => _tsNotoSans(16, FontWeight.w400);
  TextStyle get s16w500 => _tsNotoSans(16, FontWeight.w500);
  TextStyle get s16w600 => _tsNotoSans(16, FontWeight.w600);
  TextStyle get s16w700 => _tsNotoSans(16, FontWeight.w700);

  // ===== 18 =====
  TextStyle get s18w400 => _tsNotoSans(18, FontWeight.w400);
  TextStyle get s18w500 => _tsNotoSans(18, FontWeight.w500);
  TextStyle get s18w600 => _tsNotoSans(18, FontWeight.w600);
  TextStyle get s18w700 => _tsNotoSans(18, FontWeight.w700);

  // ===== 20 =====
  TextStyle get s20w400 => _tsNotoSans(20, FontWeight.w400);
  TextStyle get s20w500 => _tsNotoSans(20, FontWeight.w500);
  TextStyle get s20w600 => _tsNotoSans(20, FontWeight.w600);
  TextStyle get s20w700 => _tsNotoSans(20, FontWeight.w700);

  // ===== 22 =====
  TextStyle get s22w400 => _tsNotoSans(22, FontWeight.w400);
  TextStyle get s22w500 => _tsNotoSans(22, FontWeight.w500);
  TextStyle get s22w700 => _tsNotoSans(22, FontWeight.w700);

  // ===== 24 =====
  TextStyle get s24w400 => _tsNotoSans(24, FontWeight.w400); // FIX
  TextStyle get s24w500 => _tsNotoSans(24, FontWeight.w500);
  TextStyle get s24w600 => _tsNotoSans(24, FontWeight.w600);
  TextStyle get s24w700 => _tsNotoSans(24, FontWeight.w700);

  // ===== 28 =====
  TextStyle get s28w400 => _tsNotoSans(28, FontWeight.w400);
  TextStyle get s28w500 => _tsNotoSans(28, FontWeight.w500);
  TextStyle get s28w700 => _tsNotoSans(28, FontWeight.w700);

  // ===== 32 =====
  TextStyle get s32w400 => _tsNotoSans(32, FontWeight.w400);
  TextStyle get s32w500 => _tsNotoSans(32, FontWeight.w500);
  TextStyle get s32w700 => _tsNotoSans(32, FontWeight.w700);

  // ===== 36 =====
  TextStyle get s36w700 => _tsNotoSans(36, FontWeight.w700);

  // ===== 42 =====
  TextStyle get s42w700 => _tsNotoSans(42, FontWeight.w700);
}

TextStyle _tsNotoSans(double size, FontWeight weight) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    fontFamily: 'NotoSansJP',
    decoration: TextDecoration.none,
    color: ResColors().textPrimary,
    height: 1.5,
  );
}
