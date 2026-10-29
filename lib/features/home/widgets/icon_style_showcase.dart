import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/icon_packs.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/geo_icon.dart';
import '../../../core/widgets/icon_tile.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../core/widgets/section_header.dart';

String iconPackName(IconPack pack, AppLocalizations l10n) => switch (pack) {
  IconPack.clay => l10n.iconStyleClay,
  IconPack.goldEmerald => l10n.iconStyleGoldEmerald,
  IconPack.frostedGlass => l10n.iconStyleFrostedGlass,
  IconPack.nightGlow => l10n.iconStyleNightGlow,
};

/// "Match theme" plus the four packs. Picking one swaps every feature icon.
class IconStyleShowcase extends ConsumerWidget {
  const IconStyleShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected = ref.watch(iconStyleProvider);
    final palette = ref.watch(paletteProvider);
    final columns = switch (context.screenSize) {
      ScreenSize.mobile => 2,
      ScreenSize.tablet => 3,
      ScreenSize.desktop => 5,
    };

    return Column(
      children: [
        SectionHeader(title: l10n.iconsTitle, subtitle: l10n.iconsSubtitle),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = 14.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              alignment: WrapAlignment.center,
              children: [
                for (final style in IconStyle.values)
                  SizedBox(
                    width: width,
                    child: ScrollReveal(
                      child: _StyleCard(
                        pack: style.resolve(palette),
                        name: style.fixedPack == null
                            ? l10n.iconStyleMatch
                            : iconPackName(style.fixedPack!, l10n),
                        caption: style.fixedPack == null
                            ? l10n.iconStyleMatchCaption(
                                iconPackName(style.resolve(palette), l10n),
                              )
                            : null,
                        selected: style == selected,
                        onPressed: () =>
                            ref.read(iconStyleProvider.notifier).select(style),
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

class _StyleCard extends StatelessWidget {
  const _StyleCard({
    required this.pack,
    required this.name,
    required this.caption,
    required this.selected,
    required this.onPressed,
  });

  final IconPack pack;
  final String name;
  final String? caption;
  final bool selected;
  final VoidCallback onPressed;

  static const _preview = [IconItem.quran, IconItem.qibla, IconItem.mosques];

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    const radius = BorderRadius.all(Radius.circular(22));
    return Pressable(
      onPressed: onPressed,
      selected: selected,
      semanticLabel: caption == null ? name : '$name. $caption',
      borderRadius: radius,
      builder: (context, highlighted) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 156,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color.alphaBlend(selected ? p.accentSoft : p.bgElev1, p.bg),
          borderRadius: radius,
          border: Border.all(
            color: selected
                ? p.accent
                : highlighted
                ? p.borderStrong
                : p.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final item in _preview)
                    Flexible(child: IconTile(item, size: 44, pack: pack)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selected) ...[
                  GeoIcon(GeoGlyph.check, size: 16, color: p.accent),
                  const SizedBox(width: 6),
                ],
                Flexible(
                  child: Text(
                    name,
                    style: text.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
              child: caption == null
                  ? null
                  : Text(
                      caption!,
                      style: text.labelSmall?.copyWith(color: p.fgMuted),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
