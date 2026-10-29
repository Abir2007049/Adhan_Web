import 'package:flutter/material.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/brand_mark.dart';
import '../../../core/widgets/hero_card.dart';
import '../../../core/widgets/store_badge.dart';

class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final onHero = TextStyle(color: p.onHero);

    return HeroCard(
      radius: 32,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 20 : 48,
        vertical: context.isMobile ? 40 : 64,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const BrandMark(size: 64),
            const SizedBox(height: 24),
            Semantics(
              header: true,
              child: Text(
                l10n.downloadTitle,
                textAlign: TextAlign.center,
                style:
                    (context.isMobile ? text.headlineMedium : text.displaySmall)
                        ?.merge(onHero),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.downloadBody,
              textAlign: TextAlign.center,
              style: text.bodyLarge?.merge(onHero),
            ),
            const SizedBox(height: 28),
            const StoreBadge(),
            const SizedBox(height: 12),
            Text(l10n.storeLinkPending, style: text.labelSmall?.merge(onHero)),
          ],
        ),
      ),
    );
  }
}
