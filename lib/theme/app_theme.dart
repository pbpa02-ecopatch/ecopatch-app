import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Design system EcoPatch untuk Flutter.
///
/// Mengikuti `static/css/custom.css` di repo web:
/// - Judul memakai Baloo 2 (700/800), teks lain Plus Jakarta Sans.
/// - Kartu putih, garis 1 px `--border`, sudut 28 px, bayangan lembut.
/// - Tombol dan pil memakai sudut penuh (stadium).
class AppTheme {
  const AppTheme._();

  static const double radiusCard = 28;
  static const double radiusNav = 16;

  /// `box-shadow: 0 6px 16px rgba(34, 48, 31, .12)` pada `.card`.
  static const List<BoxShadow> cardShadow = [
    BoxShadow(color: AppColors.shadow, blurRadius: 16, offset: Offset(0, 6)),
  ];

  /// Ikon menu di pil hijau: `0 3px 0 #0f5e2d, 0 8px 14px rgba(21, 122, 60, .28)`.
  static const List<BoxShadow> activeNavShadow = [
    BoxShadow(color: AppColors.sideActiveEdge, offset: Offset(0, 3)),
    BoxShadow(color: Color(0x47157A3C), blurRadius: 14, offset: Offset(0, 8)),
  ];

  static TextStyle heading({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.w700,
    Color color = AppColors.ink,
    double height = 1.15,
  }) {
    return GoogleFonts.baloo2(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle body({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.ink,
    double height = 1.55,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  /// Kartu putih bergaris seperti `.card` di web.
  static BoxDecoration card({Color color = AppColors.surface200}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radiusCard),
      border: Border.all(color: AppColors.border),
      boxShadow: cardShadow,
    );
  }

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand600,
      primary: AppColors.brand600,
      onPrimary: Colors.white,
      secondary: AppColors.accentMango,
      onSecondary: AppColors.ink,
      surface: AppColors.surface200,
      onSurface: AppColors.ink,
      error: AppColors.danger,
      outline: AppColors.border,
    );

    final textTheme = TextTheme(
      displayLarge: heading(fontSize: 44, fontWeight: FontWeight.w800),
      displayMedium: heading(fontSize: 36, fontWeight: FontWeight.w800),
      displaySmall: heading(fontSize: 30),
      headlineLarge: heading(fontSize: 28),
      headlineMedium: heading(fontSize: 26),
      headlineSmall: heading(fontSize: 24),
      titleLarge: heading(fontSize: 22),
      titleMedium: body(fontSize: 16, fontWeight: FontWeight.w700),
      titleSmall: body(fontSize: 14, fontWeight: FontWeight.w700),
      bodyLarge: body(fontSize: 16),
      bodyMedium: body(fontSize: 14),
      bodySmall: body(fontSize: 12.5, color: AppColors.inkMuted),
      labelLarge: body(fontSize: 15, fontWeight: FontWeight.w700),
      labelMedium: body(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: body(fontSize: 11, fontWeight: FontWeight.w600),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surface100,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface200,
        foregroundColor: AppColors.ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: heading(fontSize: 22),
        iconTheme: const IconThemeData(color: AppColors.brand600, size: 24),
      ),
      cardTheme: CardTheme(
        color: AppColors.surface200,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.sideLine, thickness: 1, space: 1),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface200,
        surfaceTintColor: Colors.transparent,
        indicatorColor: AppColors.brand300,
        elevation: 3,
        height: 72,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return body(
            fontSize: 10.5,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? AppColors.brand600 : AppColors.inkMuted,
          );
        }),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.sideBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.brand500,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: body(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          side: const BorderSide(color: AppColors.border),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: body(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.brand600,
          textStyle: body(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.brand600),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.ink,
        contentTextStyle: body(fontSize: 14, color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
