import 'package:flutter/material.dart';

import '../l10n/app_language.dart';
import 'fonts.dart';

/// Two separate type systems that are never mixed:
///
/// * **UI chrome**: one sans family per script ([uiFamily]) for headings,
///   labels, navigation, the prayer clock and rows.
/// * **Content**: [quran] and [dua], for Arabic scripture and supplications
///   only. They are too calligraphic for UI labels.
///
/// Every style has a fixed `height` with even leading. Together with
/// [textHeightBehavior] this normalises row height across Arabic-script
/// fonts, which have tall ascent and descent metrics. Sizes and spacing are
/// the same in every language.
abstract final class AppTypography {
  static const textHeightBehavior = TextHeightBehavior(
    applyHeightToFirstAscent: false,
    applyHeightToLastDescent: false,
  );

  static String uiFamily(AppLanguage language) => switch (language) {
    AppLanguage.ar => FontFamilies.almarai,
    AppLanguage.ur => FontFamilies.notoSansArabic,
    AppLanguage.fa => FontFamilies.vazirmatn,
    AppLanguage.bn => FontFamilies.notoSansBengali,
    AppLanguage.hi => FontFamilies.notoSansDevanagari,
    _ => FontFamilies.inter,
  };

  static const _fallbackOrder = [
    FontFamilies.inter,
    FontFamilies.notoSansArabic,
    FontFamilies.notoSansBengali,
    FontFamilies.notoSansDevanagari,
  ];

  /// Families tried for glyphs [uiFamily] lacks, such as Latin brand names
  /// inside Arabic text.
  static List<String> uiFallback(AppLanguage language) => [
    for (final family in _fallbackOrder)
      if (family != uiFamily(language)) family,
  ];

  /// Re-fonts [base] for [language]. Used where text shows in a language
  /// other than the site's, such as the language grid.
  static TextStyle forLanguage(TextStyle base, AppLanguage language) =>
      base.copyWith(
        fontFamily: uiFamily(language),
        fontFamilyFallback: uiFallback(language),
      );

  /// UI-chrome Arabic, such as the Arabic prayer names on the Salah card.
  static TextStyle arabicUi(TextStyle base) => base.copyWith(
    fontFamily: FontFamilies.almarai,
    fontFamilyFallback: const [FontFamilies.notoSansArabic],
  );

  /// Quran text (content font).
  static TextStyle quran({required double fontSize, required Color color}) =>
      TextStyle(
        fontFamily: FontFamilies.amiriQuran,
        fontFamilyFallback: const [FontFamilies.scheherazadeNew],
        fontSize: fontSize,
        height: 2,
        leadingDistribution: TextLeadingDistribution.even,
        color: color,
      );

  /// Dua and Adhkar text (content font).
  static TextStyle dua({required double fontSize, required Color color}) =>
      TextStyle(
        fontFamily: FontFamilies.scheherazadeNew,
        fontFamilyFallback: const [FontFamilies.amiriQuran],
        fontSize: fontSize,
        height: 1.9,
        leadingDistribution: TextLeadingDistribution.even,
        color: color,
      );

  static TextTheme textTheme(AppLanguage language, Color fg, Color fgMuted) {
    final family = uiFamily(language);
    final fallback = uiFallback(language);
    TextStyle s(double size, FontWeight weight, double height, [Color? c]) =>
        TextStyle(
          fontFamily: family,
          fontFamilyFallback: fallback,
          fontSize: size,
          fontWeight: weight,
          height: height,
          leadingDistribution: TextLeadingDistribution.even,
          color: c ?? fg,
        );

    return TextTheme(
      displayLarge: s(56, FontWeight.w800, 1.12),
      displayMedium: s(44, FontWeight.w800, 1.15),
      displaySmall: s(34, FontWeight.w800, 1.2),
      headlineLarge: s(32, FontWeight.w700, 1.25),
      headlineMedium: s(28, FontWeight.w700, 1.25),
      headlineSmall: s(22, FontWeight.w700, 1.3),
      titleLarge: s(20, FontWeight.w600, 1.35),
      titleMedium: s(16, FontWeight.w600, 1.4),
      titleSmall: s(14, FontWeight.w600, 1.4),
      bodyLarge: s(17, FontWeight.w400, 1.6, fgMuted),
      bodyMedium: s(15, FontWeight.w400, 1.55),
      bodySmall: s(13, FontWeight.w400, 1.5, fgMuted),
      labelLarge: s(15, FontWeight.w600, 1.25),
      labelMedium: s(13, FontWeight.w600, 1.25),
      labelSmall: s(12, FontWeight.w600, 1.25),
    );
  }
}
