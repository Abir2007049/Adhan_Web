import 'package:flutter/material.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/geo_icon.dart';
import '../../../core/widgets/hero_card.dart';
import '../../../core/widgets/pill_button.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../core/widgets/store_badge.dart';
import 'phone_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onTryDemo});

  final VoidCallback onTryDemo;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final size = context.screenSize;
    final onHero = TextStyle(color: p.onHero);

    final title = switch (size) {
      ScreenSize.mobile => text.displaySmall,
      ScreenSize.tablet => text.displayMedium,
      ScreenSize.desktop => text.displayLarge,
    };

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: p.onHero.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: p.onHero.withValues(alpha: 0.22)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GeoIcon(GeoGlyph.diamond, size: 10, color: p.onHero),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l10n.heroEyebrow,
                  style: text.labelMedium?.merge(onHero),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Semantics(
          header: true,
          child: Text(l10n.heroTitle, style: title?.merge(onHero)),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(l10n.heroSubtitle, style: text.bodyLarge?.merge(onHero)),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const StoreBadge(),
            PillButton(
              label: l10n.heroTryDemo,
              glyph: GeoGlyph.arrowEnd,
              variant: PillVariant.onHero,
              onPressed: onTryDemo,
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(l10n.storeLinkPending, style: text.labelSmall?.merge(onHero)),
      ],
    );

    final phone = ScrollReveal(
      delay: const Duration(milliseconds: 160),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size == ScreenSize.mobile ? 520 : 612,
        ),
        child: const PhoneMockup(),
      ),
    );

    return ContentWidth(
      child: HeroCard(
        radius: 32,
        padding: EdgeInsets.symmetric(
          horizontal: size == ScreenSize.mobile ? 20 : 56,
          vertical: size == ScreenSize.mobile ? 32 : 56,
        ),
        child: size == ScreenSize.desktop
            ? Row(
                children: [
                  Expanded(child: ScrollReveal(child: copy)),
                  const SizedBox(width: 48),
                  phone,
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ScrollReveal(child: copy),
                  const SizedBox(height: 40),
                  phone,
                ],
              ),
      ),
    );
  }
}
