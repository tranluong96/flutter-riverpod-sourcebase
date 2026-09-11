import 'package:flutter/material.dart';

class ResColors {
  const ResColors._privateConstructor();

  static const ResColors _instance = ResColors._privateConstructor();

  factory ResColors() {
    return _instance;
  }

  // ===== Base colors =====
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get black25 => const Color(0x40000000);

  // ===== Primary App ======
  Color get primary => const Color(0xff98B40A);
  Color get primary50 => const Color(0xFFF9FDE8);
  Color get primary400 => const Color(0xFFBBD926);

  // ===== Gray scale =====
  Color get gray100 => const Color(0xFFF5F5F5);
  Color get gray350 => const Color(0xFFEAEEF2);
  Color get gray200 => const Color(0xFFE9EAEB);
  Color get gray300 => const Color(0xFFD5D7DA);
  Color get gray500 => const Color(0xFF717680);
  Color get gray600 => const Color(0xFF535862);
  Color get gray800 => const Color(0xFF252B37);
  Color get gray900 => const Color(0xFF101828);

  // ===== Semantic =====
  Color get textPrimary => const Color(0xFF24292F);
  Color get textLow => const Color(0xFF6E7781);
  Color get textMiddle => const Color(0xFF424A53);
  Color get textHigh => const Color(0xFF24292F);

  // ===== Yellow =====
  Color get yellow300 => const Color(0xFFFDD147);
  Color get yellow500 => const Color(0xFFEAB308);

  // ===== Red =====
  Color get red100 => const Color(0xFFFFE5E4);
  Color get red400 => const Color(0xFFFA4549);
  Color get red500 => const Color(0xFFCF222E);
  Color get red600 => const Color(0xFFA40E26);

  // ===== Green =====
  Color get green600 => const Color(0xFF116329);

  // ===== Blue =====
  Color get blue400 => const Color(0xFF218BFF);
  Color get blue500 => const Color(0xFF0969DA);

  // ===== neutral =====
  Color get neutral100 => const Color(0xFFF5F5F5);
  Color get neutral200 => const Color(0xFFD0D7DE);
}
