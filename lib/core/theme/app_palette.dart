import 'package:flutter/material.dart';

import '../utils/contrast.dart';

/// Design tokens for one palette in one brightness.
///
/// Mirrors the Android app's palette structure. Read it with
/// `context.palette` (see [PaletteContext]).
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.brightness,
    required this.bg,
    required this.bgElev1,
    required this.bgElev2,
    required this.bgElev3,
    required this.heroFrom,
    required this.heroTo,
    required this.onHero,
    required this.onHeroMuted,
    required this.fg,
    required this.fgMuted,
    required this.fgFaint,
    required this.accent,
    required this.accentStrong,
    required this.accentSoft,
    required this.accentBg,
    required this.accentBorder,
    required this.border,
    required this.borderStrong,
    required this.divider,
  });

  /// Builds a palette, filling every token the brief derives from others.
  ///
  /// Pass [lightHero] for palettes whose hero gradient is light, so text on
  /// the hero uses [fg] instead of white.
  factory AppPalette.derive({
    required Brightness brightness,
    required Color bg,
    required Color bgElev1,
    required Color bgElev2,
    required Color bgElev3,
    required Color heroFrom,
    required Color heroTo,
    required Color fg,
    required Color fgMuted,
    required Color fgFaint,
    required Color accent,
    required Color accentStrong,
    required Color border,
    Color? borderStrong,
    Color? divider,
    Color? onHero,
    Color? onHeroMuted,
    bool lightHero = false,
  }) {
    final heroText = onHero ?? (lightHero ? fg : const Color(0xFFFFFFFF));
    return AppPalette(
      brightness: brightness,
      bg: bg,
      bgElev1: bgElev1,
      bgElev2: bgElev2,
      bgElev3: bgElev3,
      heroFrom: heroFrom,
      heroTo: heroTo,
      onHero: heroText,
      onHeroMuted: onHeroMuted ?? heroText.withValues(alpha: 0.72),
      fg: fg,
      fgMuted: fgMuted,
      fgFaint: fgFaint,
      accent: accent,
      accentStrong: accentStrong,
      accentSoft: accent.withValues(alpha: 0.14),
      accentBg: accent.withValues(alpha: 0.18),
      accentBorder: accent.withValues(alpha: 0.45),
      border: border,
      borderStrong:
          borderStrong ??
          border.withValues(alpha: (border.a * 2.3).clamp(0, 1)),
      divider: divider ?? border.withValues(alpha: border.a * 0.5),
    );
  }

  final Brightness brightness;
  final Color bg;
  final Color bgElev1;
  final Color bgElev2;
  final Color bgElev3;
  final Color heroFrom;
  final Color heroTo;
  final Color onHero;
  final Color onHeroMuted;
  final Color fg;
  final Color fgMuted;
  final Color fgFaint;
  final Color accent;
  final Color accentStrong;
  final Color accentSoft;
  final Color accentBg;
  final Color accentBorder;
  final Color border;
  final Color borderStrong;
  final Color divider;

  bool get isDark => brightness == Brightness.dark;

  /// Translucent surfaces are glass and get a backdrop blur; opaque ones are
  /// drawn flat.
  bool get isGlass => bgElev1.a < 1;

  LinearGradient get heroGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [heroFrom, heroTo],
  );

  /// Text or glyph color on a solid [accent] fill.
  Color get onAccent {
    const dark = Color(0xFF0B0B12);
    const light = Color(0xFFFFFFFF);
    return contrastRatio(accent, dark) >= contrastRatio(accent, light)
        ? dark
        : light;
  }

  /// Keyboard focus outline: the accent when it stands out from [bg] at 3:1,
  /// otherwise [fg].
  Color get focusRing =>
      contrastRatio(accentStrong, bg) >= kContrastLarge ? accentStrong : fg;

  /// Palettes are fixed design tokens; build a new one with [AppPalette.derive].
  @override
  AppPalette copyWith() => this;

  @override
  AppPalette lerp(AppPalette? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppPalette(
      brightness: t < 0.5 ? brightness : other.brightness,
      bg: l(bg, other.bg),
      bgElev1: l(bgElev1, other.bgElev1),
      bgElev2: l(bgElev2, other.bgElev2),
      bgElev3: l(bgElev3, other.bgElev3),
      heroFrom: l(heroFrom, other.heroFrom),
      heroTo: l(heroTo, other.heroTo),
      onHero: l(onHero, other.onHero),
      onHeroMuted: l(onHeroMuted, other.onHeroMuted),
      fg: l(fg, other.fg),
      fgMuted: l(fgMuted, other.fgMuted),
      fgFaint: l(fgFaint, other.fgFaint),
      accent: l(accent, other.accent),
      accentStrong: l(accentStrong, other.accentStrong),
      accentSoft: l(accentSoft, other.accentSoft),
      accentBg: l(accentBg, other.accentBg),
      accentBorder: l(accentBorder, other.accentBorder),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      divider: l(divider, other.divider),
    );
  }
}

extension PaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
}
