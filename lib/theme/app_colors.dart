import 'package:flutter/material.dart';

/// Token warna EcoPatch.
///
/// Nilainya disalin apa adanya dari `:root` di `static/css/custom.css` repo web,
/// jadi aplikasi dan web memakai nama serta warna yang sama.
class AppColors {
  // --surface-100 / --surface-200 / --surface-300
  static const Color surface100 = Color(0xFFFDEDC9); // latar halaman
  static const Color surface200 = Color(0xFFFFFFFF); // kartu, navbar
  static const Color surface300 = Color(0xFFF4DCAA); // bidang hangat

  // --border / --ink / --ink-muted
  static const Color border = Color(0xFFE6CF95);
  static const Color ink = Color(0xFF22301F);
  static const Color inkMuted = Color(0xFF59684F);

  // --brand-600 / --brand-500 / --brand-300
  static const Color brand600 = Color(0xFF1F9142);
  static const Color brand500 = Color(0xFF2FBF5C);
  static const Color brand300 = Color(0xFFBDEEC7);

  // --accent-mango / --accent-sky / --danger
  static const Color accentMango = Color(0xFFFF9D2E);
  static const Color accentSky = Color(0xFF29B6D8);
  static const Color danger = Color(0xFFEF5350);

  /// Turunan sidebar web (`.site-navbar--side`).
  static const Color sideBackground = Color(0xFFFEFCF7); // surface-200 85% + surface-100 15%
  static const Color sideActive = Color(0xFF157A3C);
  static const Color sideActiveEdge = Color(0xFF0F5E2D);
  static const Color sideLine = Color(0xBFE6CF95); // border 75% + transparan

  /// Bayangan kartu web: `0 6px 16px rgba(34, 48, 31, .12)`.
  static const Color shadow = Color(0x1F22301F);
  static const Color shadowStrong = Color(0x2E22301F);
}
