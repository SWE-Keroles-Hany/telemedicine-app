import 'package:flutter/material.dart';

import 'color_manger.dart';

class AppTextStyles {
  static TextStyle get s20bold => const TextStyle(
    color: ColorManager.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s17bold => const TextStyle(
    color: ColorManager.white,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s16bold => const TextStyle(
    color: ColorManager.teal,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s15semibold => const TextStyle(
    color: ColorManager.teal,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get s14medium => const TextStyle(
    color: ColorManager.teal,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get s14regular => const TextStyle(
    color: ColorManager.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle get s13medium => const TextStyle(
    color: ColorManager.teal,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get s13regular => const TextStyle(
    color: ColorManager.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get s15bold => const TextStyle(
    color: ColorManager.textOnTeal,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  static TextStyle get s10medium => const TextStyle(
    color: ColorManager.textSecondary,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.8,
  );

  // ── Profile screen additions ──────────────────────────────────────

  static TextStyle get s22bold => const TextStyle(
    color: ColorManager.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s18bold => const TextStyle(
    color: ColorManager.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s18boldTeal => const TextStyle(
    color: ColorManager.teal,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get s16medium => const TextStyle(
    color: ColorManager.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get s15regular => const TextStyle(
    color: ColorManager.white,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get s13teal => const TextStyle(
    color: ColorManager.teal,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get s9capsLabel => const TextStyle(
    color: ColorManager.textSecondary,
    fontSize: 9,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static TextStyle get s16logoutRed => const TextStyle(
    color: ColorManager.logoutText,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // ── State-dependent styles ────────────────────────────────────────

  static TextStyle s12medium({required bool selected}) => TextStyle(
    color: selected ? ColorManager.teal : ColorManager.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle s13semibold({required bool selected}) => TextStyle(
    color: selected ? ColorManager.textOnTeal : ColorManager.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
}
