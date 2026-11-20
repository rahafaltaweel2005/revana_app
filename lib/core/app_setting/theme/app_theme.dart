import 'package:flutter/material.dart';

import '../../constant/app_spacing.dart';
import '../../constant/color_const.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // ─────────────────────────────────────────────
    // Base
    // ─────────────────────────────────────────────

    scaffoldBackgroundColor: ColorConst.bgLight,

    colorScheme: const ColorScheme.light(
      primary: ColorConst.primary,
      onPrimary: ColorConst.onPrimary,

      secondary: ColorConst.secondary,
      onSecondary: ColorConst.onSecondary,

      tertiary: ColorConst.tertiary,
      onTertiary: ColorConst.onTertiary,

      surface: ColorConst.surface,
      onSurface: ColorConst.onSurface,

      onSurfaceVariant: ColorConst.onSurfaceVariant,

      surfaceContainerLowest: ColorConst.surfaceContainerLowest,
      surfaceContainerLow: ColorConst.surfaceContainerLow,
      surfaceContainer: ColorConst.surfaceContainer,
      surfaceContainerHigh: ColorConst.surfaceContainerHigh,
      surfaceContainerHighest: ColorConst.surfaceContainerHighest,

      outline: ColorConst.outline,
      outlineVariant: ColorConst.outlineVariant,

      error: ColorConst.error,
      onError: ColorConst.onError,
    ),

    // ─────────────────────────────────────────────
    // App Bar
    // ─────────────────────────────────────────────

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgLight,
      foregroundColor: ColorConst.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,

      titleTextStyle: TextStyle(
        fontFamily: 'Playfair Display',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorConst.onSurface,
      ),
    ),

    // ─────────────────────────────────────────────
    // Typography
    // ─────────────────────────────────────────────

    textTheme: const TextTheme(
      // Playfair Display
      displayLarge: TextStyle(
        fontFamily: 'Playfair Display',
        fontSize: 44,
        height: 52 / 44,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.88,
        color: ColorConst.onSurface,
      ),

      headlineLarge: TextStyle(
        fontFamily: 'Playfair Display',
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.36,
        color: ColorConst.onSurface,
      ),

      headlineMedium: TextStyle(
        fontFamily: 'Playfair Display',
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.28,
        color: ColorConst.onSurface,
      ),

      headlineSmall: TextStyle(
        fontFamily: 'Playfair Display',
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w600,
        color: ColorConst.onSurface,
      ),

      // Plus Jakarta Sans
      titleLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.18,
        color: ColorConst.onSurface,
      ),

      titleMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: ColorConst.onSurface,
      ),

      bodyLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16,
        height: 26 / 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.16,
        color: ColorConst.onSurface,
      ),

      bodyMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 14,
        height: 22 / 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.14,
        color: ColorConst.onSurfaceVariant,
      ),

      bodySmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 12,
        height: 18 / 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.24,
        color: ColorConst.onSurfaceVariant,
      ),

      labelLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 13,
        height: 18 / 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.26,
        color: ColorConst.onSurface,
      ),

      labelMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.24,
        color: ColorConst.onSurfaceVariant,
      ),

      labelSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 10,
        height: 14 / 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
        color: ColorConst.onSurfaceVariant,
      ),
    ),

    // ─────────────────────────────────────────────
    // Input Fields
    // ─────────────────────────────────────────────

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConst.surface,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      hintStyle: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorConst.onSurfaceVariant.withValues(alpha: 0.7),
      ),

      labelStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: ColorConst.onSurfaceVariant,
      ),

      floatingLabelStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
        color: ColorConst.secondary,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.outlineVariant,
          width: 1,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.outlineVariant,
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.secondary,
          width: 1,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.error,
          width: 1,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.error,
          width: 1,
        ),
      ),

      errorStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 11,
        height: 16 / 11,
        color: ColorConst.error,
      ),
    ),

    // ─────────────────────────────────────────────
    // Primary Button
    // ─────────────────────────────────────────────

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.primary,
        foregroundColor: ColorConst.onPrimary,

        minimumSize: const Size(64, 52),

        elevation: 0,
        shadowColor: Colors.transparent,

        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),

        shape: const StadiumBorder(),

        textStyle: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.26,
        ),

        overlayColor: ColorConst.secondary.withValues(alpha: 0.08),
      ),
    ),

    // ─────────────────────────────────────────────
    // Text Button
    // ─────────────────────────────────────────────

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorConst.primary,

        textStyle: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.26,
        ),

        shape: const StadiumBorder(),
      ),
    ),

    // ─────────────────────────────────────────────
    // Outlined Button
    // ─────────────────────────────────────────────

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorConst.primary,

        minimumSize: const Size(64, 52),

        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),

        side: const BorderSide(
          color: ColorConst.primary,
          width: 1,
        ),

        shape: const StadiumBorder(),

        textStyle: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.26,
        ),
      ),
    ),

    // ─────────────────────────────────────────────
    // Cards
    // ─────────────────────────────────────────────

    cardTheme: CardThemeData(
      color: ColorConst.surface,
      elevation: 0,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        side: const BorderSide(
          color: ColorConst.outlineVariant,
          width: 1,
        ),
      ),
    ),

    // ─────────────────────────────────────────────
    // Divider
    // ─────────────────────────────────────────────

    dividerTheme: const DividerThemeData(
      color: ColorConst.outlineVariant,
      thickness: 1,
      space: 1,
    ),

    // ─────────────────────────────────────────────
    // Icon
    // ─────────────────────────────────────────────

    iconTheme: const IconThemeData(
      color: ColorConst.onSurface,
      size: 22,
    ),

    // ─────────────────────────────────────────────
    // Chip
    // ─────────────────────────────────────────────

    chipTheme: ChipThemeData(
      backgroundColor: ColorConst.surface,
      selectedColor: ColorConst.surfaceContainerLow,

      side:  BorderSide(
        color: ColorConst.outlineVariant,
        width: 1,
      ),

      shape: const StadiumBorder(),

      labelStyle: const TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.24,
        color: ColorConst.onSurfaceVariant,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    ),
  );
}