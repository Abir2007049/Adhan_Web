import 'package:flutter/material.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_header.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final items = [
      (l10n.faqCalculationQ, l10n.faqCalculationA),
      (l10n.faqAdhanQ, l10n.faqAdhanA),
      (l10n.faqQiblaQ, l10n.faqQiblaA),
      (l10n.faqLanguagesQ, l10n.faqLanguagesA),
      (l10n.faqLookQ, l10n.faqLookA),
      (l10n.faqPlatformQ, l10n.faqPlatformA),
    ];

    return Column(
      children: [
        SectionHeader(title: l10n.faqTitle),
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: GlassCard(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                for (final (i, (question, answer)) in items.indexed) ...[
                  if (i > 0)
                    Divider(indent: 20, endIndent: 20, color: p.divider),
                  ExpansionTile(
                    title: Text(question, style: text.titleMedium),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(answer, style: text.bodyLarge)],
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
