import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/palettes.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/geo_icon.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../shell/theme_mode_pills.dart';

String paletteName(PaletteId id, AppLocalizations l10n) => switch (id) {
  PaletteId.violet => l10n.paletteViolet,
  PaletteId.emerald => l10n.paletteEmerald,
  PaletteId.green => l10n.paletteGreen,
  PaletteId.roseGold => l10n.paletteRoseGold,
  PaletteId.diSerria => l10n.paletteDiSerria,
  PaletteId.rose => l10n.paletteRose,
  PaletteId.pearl => l10n.palettePearl,
  PaletteId.deepPlum => l10n.paletteDeepPlum,
  PaletteId.pink => l10n.palettePink,
  PaletteId.purple => l10n.palettePurple,
  PaletteId.aurora => l10n.paletteAurora,
  PaletteId.dusk => l10n.paletteDusk,
};

/// All 12 palettes as swatches. Picking one re-themes the site and is saved.
class ThemeShowcase extends ConsumerWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected = ref.watch(paletteProvider);
    final brightness = Theme.of(context).brightness;
    final columns = switch (context.screenSize) {
      ScreenSize.mobile => 2,
      ScreenSize.tablet => 4,
      ScreenSize.desktop => 6,
    };

    return Column(
      children: [
        SectionHeader(title: l10n.themesTitle, subtitle: l10n.themesSubtitle),
        const SizedBox(height: 28),
        const ThemeModePills(alignment: WrapAlignment.center),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = 14.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final id in PaletteId.values)
                  SizedBox(
                    width: width,
                    child: ScrollReveal(
                      child: _Swatch(
                        name: paletteName(id, l10n),
                        palette: id.resolve(brightness),
                        isDefault: id == PaletteId.fallback,
                        selected: id == selected,
                        onPressed: () =>
                            ref.read(paletteProvider.notifier).select(id),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({
    required this.name,
    required this.palette,
    required this.isDefault,
    required this.selected,
    required this.onPressed,
  });

  final String name;

  /// The palette being previewed (not the active one).
  final AppPalette palette;
  final bool isDefault;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final site = context.palette;
    final text = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    const radius = BorderRadius.all(Radius.circular(22));

    return Pressable(
      onPressed: onPressed,
      selected: selected,
      semanticLabel: isDefault ? '$name, ${l10n.defaultBadge}' : name,
      borderRadius: radius,
      builder: (context, highlighted) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.alphaBlend(site.bgElev1, site.bg),
          borderRadius: radius,
          border: Border.all(
            color: selected
                ? site.accent
                : highlighted
                ? site.borderStrong
                : site.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Preview(palette: palette),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 6, 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: text.labelLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (selected)
                    GeoIcon(GeoGlyph.check, size: 18, color: site.accent)
                  else if (isDefault)
                    Text(
                      l10n.defaultBadge,
                      style: text.labelSmall?.copyWith(color: site.fgMuted),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A miniature of the app's home screen in [palette].
class _Preview extends StatelessWidget {
  const _Preview({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final p = palette;
    Widget bar(double widthFactor, Color color) => FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
    return Container(
      height: 96,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: p.bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: p.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: p.heroGradient,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bar(0.55, p.onHero),
                  const SizedBox(height: 5),
                  bar(0.35, p.onHeroMuted),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: p.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(child: bar(0.8, p.fgMuted)),
            ],
          ),
        ],
      ),
    );
  }
}
