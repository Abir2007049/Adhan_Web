import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/core/theme/app_palette.dart';
import 'package:muslim_soul_web/core/theme/palettes.dart';
import 'package:muslim_soul_web/core/utils/contrast.dart';

/// WCAG AA for every palette in both brightnesses. See README, "Contrast
/// adjustments", for the tokens nudged to pass.
void main() {
  for (final id in PaletteId.values) {
    for (final brightness in Brightness.values) {
      group('${id.storageKey} ${brightness.name}', () {
        final p = id.resolve(brightness);
        final surfaces = {
          'bg': p.bg,
          'bgElev1': composite(p.bgElev1, p.bg),
          'bgElev2': composite(p.bgElev2, p.bg),
          'bgElev3': composite(p.bgElev3, p.bg),
        };

        void expectContrast(Color fg, Color bg, double min, String what) {
          final ratio = contrastRatio(composite(fg, bg), bg);
          expect(
            ratio,
            greaterThanOrEqualTo(min),
            reason: '$what is ${ratio.toStringAsFixed(2)}:1, needs $min:1',
          );
        }

        test('fg and fgMuted pass 4.5:1 on bg and elevated surfaces', () {
          for (final MapEntry(key: name, value: surface) in surfaces.entries) {
            expectContrast(p.fg, surface, kContrastBody, 'fg on $name');
            expectContrast(
              p.fgMuted,
              surface,
              kContrastBody,
              'fgMuted on $name',
            );
          }
        });

        test('onHero passes 4.5:1 across the hero gradient', () {
          expectContrast(
            p.onHero,
            p.heroFrom,
            kContrastBody,
            'onHero on heroFrom',
          );
          expectContrast(p.onHero, p.heroTo, kContrastBody, 'onHero on heroTo');
        });

        test('onHeroMuted passes 3:1 (large text only)', () {
          expectContrast(
            p.onHeroMuted,
            p.heroFrom,
            kContrastLarge,
            'onHeroMuted on heroFrom',
          );
          expectContrast(
            p.onHeroMuted,
            p.heroTo,
            kContrastLarge,
            'onHeroMuted on heroTo',
          );
        });

        test('button labels pass 4.5:1 on the accent fill', () {
          expectContrast(
            p.onAccent,
            p.accent,
            kContrastBody,
            'onAccent on accent',
          );
        });

        test('focus ring passes 3:1 against bg', () {
          expectContrast(p.focusRing, p.bg, kContrastLarge, 'focusRing on bg');
        });
      });
    }
  }

  test('derived tokens follow the brief', () {
    final p = AppPalette.derive(
      brightness: Brightness.dark,
      bg: const Color(0xFF000000),
      bgElev1: const Color(0x0AFFFFFF),
      bgElev2: const Color(0x0FFFFFFF),
      bgElev3: const Color(0x17FFFFFF),
      heroFrom: const Color(0xFF7C3AED),
      heroTo: const Color(0xFF1E1B4B),
      fg: const Color(0xFFFFFFFF),
      fgMuted: const Color(0xFFCCCCCC),
      fgFaint: const Color(0xFF888888),
      accent: const Color(0xFF38BDF8),
      accentStrong: const Color(0xFF7DD3FC),
      border: const Color(0x20A78BFA),
    );
    expect(p.onHero, const Color(0xFFFFFFFF));
    expect(p.onHeroMuted.a, closeTo(0.72, 0.005));
    expect(p.accentSoft.a, closeTo(0.14, 0.005));
    expect(p.accentBg.a, closeTo(0.18, 0.005));
    expect(p.accentBorder.a, closeTo(0.45, 0.005));
    expect(p.borderStrong.a, closeTo(p.border.a * 2.3, 0.005));
    expect(p.divider.a, closeTo(p.border.a * 0.5, 0.005));
    expect(p.isGlass, isTrue);
  });

  test('light-mode primary buttons carry white labels', () {
    // PEARL's accent is a light peach by design, so its labels are dark.
    for (final id in PaletteId.values.where((id) => id != PaletteId.pearl)) {
      expect(
        id.resolve(Brightness.light).onAccent,
        const Color(0xFFFFFFFF),
        reason: id.storageKey,
      );
    }
  });

  test('light-hero palettes put dark text on the hero', () {
    for (final (id, brightness) in [
      (PaletteId.pearl, Brightness.light),
      (PaletteId.pearl, Brightness.dark),
      (PaletteId.roseGold, Brightness.light),
    ]) {
      final p = id.resolve(brightness);
      expect(
        p.onHero.computeLuminance(),
        lessThan(0.1),
        reason: '$id $brightness',
      );
    }
  });
}
