import 'package:flutter/material.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/icon_packs.dart';
import '../../../core/typography/app_typography.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/equal_height_grid.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/icon_tile.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../core/widgets/section_header.dart';

typedef _Feature = ({IconItem icon, String title, String body});

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final List<_Feature> features = [
      (
        icon: IconItem.location,
        title: l10n.featurePrayerTimesTitle,
        body: l10n.featurePrayerTimesBody,
      ),
      (
        icon: IconItem.prayerTimes,
        title: l10n.featureAdhanTitle,
        body: l10n.featureAdhanBody,
      ),
      (
        icon: IconItem.qibla,
        title: l10n.featureQiblaTitle,
        body: l10n.featureQiblaBody,
      ),
      (
        icon: IconItem.quran,
        title: l10n.featureQuranTitle,
        body: l10n.featureQuranBody,
      ),
      (
        icon: IconItem.duas,
        title: l10n.featureDuaTitle,
        body: l10n.featureDuaBody,
      ),
      (
        icon: IconItem.mosques,
        title: l10n.featureMosquesTitle,
        body: l10n.featureMosquesBody,
      ),
      (
        icon: IconItem.zakat,
        title: l10n.featureZakatTitle,
        body: l10n.featureZakatBody,
      ),
      (
        icon: IconItem.calendar,
        title: l10n.featureCalendarTitle,
        body: l10n.featureCalendarBody,
      ),
      (
        icon: IconItem.weather,
        title: l10n.featureWeatherTitle,
        body: l10n.featureWeatherBody,
      ),
      (
        icon: IconItem.settings,
        title: l10n.featureWidgetTitle,
        body: l10n.featureWidgetBody,
      ),
      (
        icon: IconItem.themes,
        title: l10n.featureThemesTitle,
        body: l10n.featureThemesBody,
      ),
      (
        icon: IconItem.account,
        title: l10n.featureLanguagesTitle,
        body: l10n.featureLanguagesBody,
      ),
    ];
    final columns = switch (context.screenSize) {
      ScreenSize.mobile => 1,
      ScreenSize.tablet => 3,
      ScreenSize.desktop => 4,
    };

    return Column(
      children: [
        SectionHeader(
          title: l10n.featuresTitle,
          subtitle: l10n.featuresSubtitle,
        ),
        const SizedBox(height: 48),
        EqualHeightGrid(
          columns: columns,
          children: [
            for (final (i, feature) in features.indexed)
              ScrollReveal(
                delay: Duration(milliseconds: 40 * (i % columns)),
                child: _FeatureCard(feature: feature, horizontal: columns == 1),
              ),
          ],
        ),
        const SizedBox(height: 24),
        const ScrollReveal(child: _ReadingSamples()),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.feature, required this.horizontal});

  final _Feature feature;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(feature.title, style: text.titleMedium),
        const SizedBox(height: 6),
        Text(feature.body, style: text.bodySmall),
      ],
    );
    return MergeSemantics(
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        child: horizontal
            ? Row(
                children: [
                  IconTile(feature.icon, size: 56),
                  const SizedBox(width: 16),
                  Expanded(child: copy),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconTile(feature.icon, size: 68),
                  const SizedBox(height: 16),
                  copy,
                ],
              ),
      ),
    );
  }
}

/// Quran and dua samples in the content fonts.
class _ReadingSamples extends StatelessWidget {
  const _ReadingSamples();

  // Al-Fatihah 1:1 and Al-Baqarah 2:201.
  static const _ayah = 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ';
  static const _dua =
      'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final mobile = context.isMobile;

    Widget sample(String arabic, TextStyle style, String reference) =>
        GlassCard(
          fill: p.bgElev2,
          child: Column(
            children: [
              Text(
                arabic,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: style,
              ),
              const SizedBox(height: 8),
              Text(
                reference,
                style: text.labelMedium?.copyWith(color: p.fgMuted),
              ),
            ],
          ),
        );

    final ayah = sample(
      _ayah,
      AppTypography.quran(fontSize: mobile ? 28 : 34, color: p.fg),
      l10n.readingAyahRef,
    );
    final dua = sample(
      _dua,
      AppTypography.dua(fontSize: mobile ? 22 : 26, color: p.fg),
      l10n.readingDuaRef,
    );

    return GlassCard(
      padding: EdgeInsets.all(mobile ? 20 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.readingTitle, style: text.titleLarge),
          const SizedBox(height: 6),
          Text(
            l10n.readingBody,
            style: text.bodyMedium?.copyWith(color: p.fgMuted),
          ),
          const SizedBox(height: 24),
          if (mobile) ...[
            ayah,
            const SizedBox(height: 16),
            dua,
          ] else
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: ayah),
                  const SizedBox(width: 16),
                  Expanded(child: dua),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
