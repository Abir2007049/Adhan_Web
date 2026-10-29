import 'package:flutter/material.dart';

import '../l10n/app_language.dart';
import '../typography/app_typography.dart';
import 'palettes.dart';

abstract final class AppTheme {
  static ThemeData build(
    PaletteId paletteId,
    Brightness brightness,
    AppLanguage language,
  ) {
    final p = paletteId.resolve(brightness);
    final text = AppTypography.textTheme(language, p.fg, p.fgMuted);
    final surface = Color.alphaBlend(p.bgElev1, p.bg);
    final raised = Color.alphaBlend(p.bgElev3, p.bg);
    final isDark = brightness == Brightness.dark;
    final radius16 = BorderRadius.circular(16);

    final scheme = ColorScheme(
      brightness: brightness,
      primary: p.accent,
      onPrimary: p.onAccent,
      primaryContainer: Color.alphaBlend(p.accentBg, p.bg),
      onPrimaryContainer: p.fg,
      secondary: p.accentStrong,
      onSecondary: p.onAccent,
      error: isDark ? const Color(0xFFFFB4AB) : const Color(0xFFB3261E),
      onError: isDark ? const Color(0xFF690005) : const Color(0xFFFFFFFF),
      surface: p.bg,
      onSurface: p.fg,
      onSurfaceVariant: p.fgMuted,
      surfaceContainerLowest: p.bg,
      surfaceContainerLow: surface,
      surfaceContainer: Color.alphaBlend(p.bgElev2, p.bg),
      surfaceContainerHigh: raised,
      surfaceContainerHighest: raised,
      outline: p.borderStrong,
      outlineVariant: p.border,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: p.bg,
      canvasColor: p.bg,
      textTheme: text,
      extensions: [p],
      dividerColor: p.divider,
      focusColor: p.accentSoft,
      hoverColor: p.fg.withValues(alpha: 0.04),
      splashFactory: InkRipple.splashFactory,
      iconTheme: IconThemeData(color: p.fg, size: 22),
      dividerTheme: DividerThemeData(color: p.divider, thickness: 1, space: 1),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(raised),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
          elevation: const WidgetStatePropertyAll(8),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: radius16,
              side: BorderSide(color: p.border),
            ),
          ),
        ),
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(text.labelLarge),
          foregroundColor: WidgetStatePropertyAll(p.fg),
          minimumSize: const WidgetStatePropertyAll(Size(200, 44)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 14),
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          overlayColor: WidgetStatePropertyAll(p.accentSoft),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: p.fg, borderRadius: radius16),
        textStyle: text.labelMedium?.copyWith(color: p.bg),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: raised,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: p.borderStrong,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: p.accent,
        collapsedIconColor: p.fgMuted,
        textColor: p.fg,
        collapsedTextColor: p.fg,
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        childrenPadding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.alphaBlend(p.bgElev2, p.bg),
        labelStyle: text.bodyMedium?.copyWith(color: p.fgMuted),
        floatingLabelStyle: text.labelMedium?.copyWith(color: p.fg),
        border: OutlineInputBorder(
          borderRadius: radius16,
          borderSide: BorderSide(color: p.borderStrong),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius16,
          borderSide: BorderSide(color: p.borderStrong),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius16,
          borderSide: BorderSide(color: p.focusRing, width: 2),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: p.accent),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: p.accent,
        selectionColor: p.accentBg,
        selectionHandleColor: p.accent,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(p.borderStrong),
        radius: const Radius.circular(8),
      ),
    );
  }
}
