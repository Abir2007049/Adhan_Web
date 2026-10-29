import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/app_language.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/language_controller.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/typography/app_typography.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../core/widgets/section_header.dart';

/// The 12 languages, each written in its own script with its own UI font.
/// Picking one switches the site language.
class LanguagesSection extends ConsumerWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(languageProvider);
    final columns = switch (context.screenSize) {
      ScreenSize.mobile => 2,
      ScreenSize.tablet => 4,
      ScreenSize.desktop => 6,
    };

    return Column(
      children: [
        SectionHeader(
          title: l10n.languagesTitle,
          subtitle: l10n.languagesSubtitle,
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = 14.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final language in AppLanguage.values)
                  SizedBox(
                    width: width,
                    child: ScrollReveal(
                      child: _LanguageCard(
                        language: language,
                        selected: language == current,
                        rtlLabel: l10n.rtlBadge,
                        onPressed: () => ref
                            .read(languageProvider.notifier)
                            .select(language),
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

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.language,
    required this.selected,
    required this.rtlLabel,
    required this.onPressed,
  });

  final AppLanguage language;
  final bool selected;
  final String rtlLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    // The card's own language says "Prayer times" as a sample.
    final sample = lookupAppLocalizations(language.locale).navPrayerTimes;
    const radius = BorderRadius.all(Radius.circular(20));

    return Pressable(
      onPressed: onPressed,
      selected: selected,
      semanticLabel: language.nativeName,
      borderRadius: radius,
      builder: (context, highlighted) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 104,
        padding: const EdgeInsets.all(16),
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
        child: Directionality(
          textDirection: language.textDirection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      language.nativeName,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.forLanguage(
                        text.titleMedium!,
                        language,
                      ),
                    ),
                  ),
                  if (language.isRtl)
                    Text(
                      rtlLabel,
                      style: text.labelSmall?.copyWith(color: p.fgMuted),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                sample,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.forLanguage(text.bodySmall!, language),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
