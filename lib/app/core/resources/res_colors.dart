import 'package:flutter/material.dart';

class ResColors {
  const ResColors._privateConstructor();

  static const ResColors _instance = ResColors._privateConstructor();

  factory ResColors() {
    return _instance;
  }

  // ===== Base colors =====
  Color get white => const Color(0xFFFFFFFF);
  Color get white_100 => const Color(0xFFF1F5F9);
  Color get black => const Color(0xFF000000);
  Color get yellow => const Color(0xFFFAC215);

  // ===== Primary App ======
  Color get primary => const Color(0xFFCA9A04);
  Color get primary_50 => const Color(0xFFFEF9E8);
  Color get primary_400 => const Color(0xFFFECE3C);

  // ===== Black with opacity =====
  Color get black_06 => const Color(0xFF000000).withValues(alpha: 0.06);
  Color get black_07 => const Color(0xFF000000).withValues(alpha: 0.07);
  Color get black_10 => const Color(0xFF000000).withValues(alpha: 0.10);
  Color get black_15 => const Color(0xFF000000).withValues(alpha: 0.15);
  Color get black_25 => const Color(0xFF000000).withValues(alpha: 0.25);
  Color get black_30 => const Color(0xFF000000).withValues(alpha: 0.30);
  Color get black_45 => const Color(0xFF000000).withValues(alpha: 0.45);
  Color get black_70 => const Color(0xFF000000).withValues(alpha: 0.70);
  Color get black_85 => const Color(0xFF000000).withValues(alpha: 0.85);

  // ===== Neutral / Gray scale =====
  Color get gray_50 => const Color(0xFFF6F8FA);
  Color get gray_100 => const Color(0xFFF5F5F5);
  Color get gray_350 => const Color(0xFFEAEEF2);
  Color get gray_850 => const Color.fromRGBO(107, 107, 107, 0.85);
  Color get gray_950 => const Color(0xFF4C4C4C);
  Color get gray_970 => const Color(0xFF333333);
  Color get gray_980 => const Color(0xFF2C2C2C);
  Color get gray_990 => const Color(0xFF262626);

  // ===== Semantic =====

  Color get gray_200 => const Color(0xFFE9EAEB);
  Color get gray_300 => const Color(0xFFD5D7DA);
  Color get gray_400 => const Color(0xFFA4A7AE);
  Color get gray_500 => const Color(0xFF717680);
  Color get gray_600 => const Color(0xFF535862);
  Color get gray_700 => const Color(0xFF414651);
  Color get gray_800 => const Color(0xFF252B37);
  Color get gray_900 => const Color(0xFF101828);

  // ===== Semantic =====
  Color get textPrimary => const Color(0xFF24292F);
  Color get textLow => const Color(0xFF6E7781);
  Color get textMiddle => const Color(0xFF424A53);
  Color get textHigh => const Color(0xFF24292F);
  Color get bgAppBar => const Color(0xFF001529);
  Color get appPrimary_600 => const Color(0xFFCA9A04);
  Color get baseBorder => const Color(0xFFE5E5E5);
  Color get baseBackgroundSecondary => const Color(0xFFFAFAFA);
  Color get ringNormal => const Color(0xFF096CDC);
  Color get company_50 => const Color(0xFFE5F6FF);
  Color get admin_100 => const Color(0xFFFEEDC7);
  Color get admin_50 => const Color(0xFFFFF9EB);

  // ===== Warm / Beige =====
  Color get beige_100 => const Color(0xFFF8F0E5);
  Color get beige_200 => const Color(0xFFF9F1E6);
  Color get apricot_200 => const Color(0xFFFED8B2);
  Color get sunset_200 => const Color(0xFFFBD7A6);

  // ===== Orange / Yellow =====
  Color get orange_50 => const Color(0xFFFFF1E5);
  Color get orange_100 => const Color(0xFFFFD8B5);
  Color get orange_200 => const Color(0xFFFFB77C);
  Color get orange_300 => const Color(0xFFFB8F44);
  Color get orange_400 => const Color(0xFFE16F24);
  Color get orange_500 => const Color(0xFFBC4C00);
  Color get orange_600 => const Color(0xFF953800);
  Color get orange_700 => const Color(0xFF762C00);
  Color get orange_800 => const Color(0xFF5C2200);
  Color get orange_900 => const Color(0xFF471700);

  Color get yellow_50 => const Color(0xFFFEF9E8);
  Color get yellow_100 => const Color(0xFFFEF0C3);
  Color get yellow_200 => const Color(0xFFFEE28A);
  Color get yellow_300 => const Color(0xFFFDD147);
  Color get yellow_400 => const Color(0xFFFAC215);
  Color get yellow_500 => const Color(0xFFEAB308);
  Color get yellow_600 => const Color(0xFFCA9A04);
  Color get yellow_700 => const Color(0xFFA16207);
  Color get yellow_800 => const Color(0xFF854D0E);
  Color get yellow_900 => const Color(0xFF713F12);

  // ===== Red =====
  Color get red_50 => const Color(0xFFFFF6F5);
  Color get red_100 => const Color(0xFFFFE5E4);
  Color get red_200 => const Color(0xFFFFBBB9);
  Color get red_300 => const Color(0xFFFF8182);
  Color get red_400 => const Color(0xFFFA4549);
  Color get red_450 => const Color(0xFFE60012);
  Color get red_500 => const Color(0xFFCF222E);
  Color get red_600 => const Color(0xFFA40E26);
  Color get red_700 => const Color(0xFF82071E);
  Color get red_800 => const Color(0xFF660018);
  Color get red_900 => const Color(0xFF4C0014);

  // ===== Green =====
  Color get green_50 => const Color(0xFFEDFDF0);
  Color get green_100 => const Color(0xFFC5F7D0);
  Color get green_200 => const Color(0xFF6FDD8B);
  Color get green_300 => const Color(0xFF4AC26B);
  Color get green_400 => const Color(0xFF2DA44E);
  Color get green_500 => const Color(0xFF1A7F37);
  Color get green_600 => const Color(0xFF116329);
  Color get green_700 => const Color(0xFF044F1E);
  Color get green_800 => const Color(0xFF003D16);
  Color get green_900 => const Color(0xFF002D11);

  // ===== Blue =====
  Color get blue_50 => const Color(0xFFEAF8FF);
  Color get blue_100 => const Color(0xFFCEEDFF);
  Color get blue_200 => const Color(0xFF97D3FF);
  Color get blue_300 => const Color(0xFF61B3FF);
  Color get blue_400 => const Color(0xFF218BFF);
  Color get blue_500 => const Color(0xFF0969DA);
  Color get blue_600 => const Color(0xFF0550AE);
  Color get blue_700 => const Color(0xFF033D8B);
  Color get blue_800 => const Color(0xFF0A3069);
  Color get blue_900 => const Color(0xFF002155);

  // ===== Purple =====
  Color get purple_50 => const Color(0xFFFBEFFF);
  Color get purple_100 => const Color(0xFFECD8FF);
  Color get purple_200 => const Color(0xFFD8B9FF);
  Color get purple_300 => const Color(0xFFC297FF);
  Color get purple_400 => const Color(0xFFA475F9);
  Color get purple_500 => const Color(0xFF8250DF);
  Color get purple_600 => const Color(0xFF6639BA);
  Color get purple_700 => const Color(0xFF512A97);
  Color get purple_800 => const Color(0xFF3E1F79);
  Color get purple_900 => const Color(0xFF2E1461);

  // ===== Pink =====
  Color get pink_50 => const Color(0xFFFFEFF7);
  Color get pink_100 => const Color(0xFFFFD3EB);
  Color get pink_200 => const Color(0xFFFFADDA);
  Color get pink_300 => const Color(0xFFFF80C8);
  Color get pink_400 => const Color(0xFFE85AAD);
  Color get pink_500 => const Color(0xFFBF3989);
  Color get pink_600 => const Color(0xFF99286E);
  Color get pink_700 => const Color(0xFF772057);
  Color get pink_800 => const Color(0xFF611347);
  Color get pink_900 => const Color(0xFF4D0336);

  // ===== Warning =====
  Color get warning_01 => const Color(0xFFFFF7E6);
  Color get warning_02 => const Color(0xFFFFE7BA);
  Color get warning_03 => const Color(0xFFFFD591);
  Color get warning_500 => const Color(0xFFEAB308);

  // ===== Pink / Red soft =====
  Color get pink_1 => const Color(0xFFFFF1F0);
  Color get pink_2 => const Color(0xFFFFCCC7);

  // ===== yellow soft =====
  Color get yellow_1 => const Color(0xFFFCE6AF);

  // ===== Others =====
  Color get shell_100 => const Color(0xFFF0F2F5);
  Color get ripple => const Color(0xFFE3EFF2);

  // negative
  // ===== negative =====
  Color get negative_500 => const Color(0xFFCF222E);

  // ===== neutral =====
  Color get neutral_100 => const Color(0xFFF5F5F5);
  Color get neutral_200 => const Color(0xFFD0D7DE);
  Color get neutral_500 => const Color(0xFF6E7781);
}
