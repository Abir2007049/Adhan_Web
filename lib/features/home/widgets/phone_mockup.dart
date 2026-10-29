import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/app_language.dart';
import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/l10n/language_controller.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/typography/app_typography.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/time_format.dart';
import '../../../core/widgets/geo_icon.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/hero_card.dart';
import '../../prayer_demo/domain/makkah_schedule.dart';
import '../../prayer_demo/domain/prayer.dart';
import 'analog_clock.dart';

/// A phone showing the app's home screen: the Salah card and today's
/// prayer list, live for Makkah.
class PhoneMockup extends ConsumerWidget {
  const PhoneMockup({super.key});

  static const _width = 300.0;
  static const _height = 612.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = context.palette;
    final l10n = AppLocalizations.of(context);
    final language = ref.watch(languageProvider);
    final snapshot = MakkahSchedule.at(ref.watch(clockProvider));
    final text = Theme.of(context).textTheme;

    final screen = Container(
      width: _width,
      height: _height,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B12),
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: const Color(0x33FFFFFF), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 40,
            offset: Offset(0, 24),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: ColoredBox(
          color: p.bg,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GeoIcon(GeoGlyph.location, size: 16, color: p.accent),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        l10n.cityMakkah,
                        style: text.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      formatClockTime(
                        snapshot.makkahNow.hour,
                        snapshot.makkahNow.minute,
                        language,
                      ),
                      style: text.labelMedium?.copyWith(color: p.fgMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                _SalahCard(snapshot: snapshot),
                const SizedBox(height: 12),
                Expanded(child: _PrayerList(snapshot: snapshot)),
              ],
            ),
          ),
        ),
      ),
    );

    return Semantics(
      label:
          '${l10n.cityMakkah}. ${l10n.nextPrayer}: ${snapshot.next.label(l10n)}, '
          '${formatClockTime(snapshot.nextTime.hour, snapshot.nextTime.minute, language)}',
      child: ExcludeSemantics(
        child: FittedBox(fit: BoxFit.scaleDown, child: screen),
      ),
    );
  }
}

class _SalahCard extends ConsumerWidget {
  const _SalahCard({required this.snapshot});

  final SalahSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = context.palette;
    final l10n = AppLocalizations.of(context);
    final language = ref.watch(languageProvider);
    final text = Theme.of(context).textTheme;
    final onHero = TextStyle(color: p.onHero);

    return HeroCard(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      radius: 24,
      child: Column(
        children: [
          Text(l10n.nextPrayer, style: text.labelSmall?.merge(onHero)),
          const SizedBox(height: 10),
          Row(
            children: [
              AnalogClock(time: snapshot.makkahNow, ink: p.onHero, size: 104),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    // In Arabic the label below already is the Arabic name.
                    if (language != AppLanguage.ar)
                      Text(
                        snapshot.next.arabicName,
                        textDirection: TextDirection.rtl,
                        style: AppTypography.arabicUi(
                          text.headlineSmall!,
                        ).copyWith(color: p.onHeroMuted),
                      ),
                    Text(
                      snapshot.next.label(l10n),
                      style: text.titleMedium?.merge(onHero),
                    ),
                    const SizedBox(height: 2),
                    FittedBox(
                      child: Text(
                        formatClockTime(
                          snapshot.nextTime.hour,
                          snapshot.nextTime.minute,
                          language,
                        ),
                        style: text.headlineMedium?.copyWith(
                          color: p.onHero,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              _Chip(
                label: l10n.startsIn(
                  formatCountdown(snapshot.remaining, language),
                ),
              ),
              _Chip(label: l10n.adhanOn),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: p.onHero.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: p.onHero.withValues(alpha: 0.24)),
      ),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: p.onHero),
      ),
    );
  }
}

class _PrayerList extends ConsumerWidget {
  const _PrayerList({required this.snapshot});

  final SalahSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = context.palette;
    final l10n = AppLocalizations.of(context);
    final language = ref.watch(languageProvider);
    final text = Theme.of(context).textTheme;

    return GlassCard(
      padding: const EdgeInsets.all(6),
      radius: 20,
      child: Column(
        children: [
          for (final prayer in Prayer.values)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: prayer == snapshot.next
                    ? BoxDecoration(
                        color: p.accentBg,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: p.accentBorder),
                      )
                    : null,
                child: Row(
                  children: [
                    GeoIcon(
                      GeoGlyph.diamond,
                      size: 10,
                      color: prayer == snapshot.next ? p.accent : p.fgFaint,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        prayer.label(l10n),
                        overflow: TextOverflow.ellipsis,
                        style: text.labelLarge?.copyWith(
                          color: prayer.isSalah ? p.fg : p.fgMuted,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Long meridiem words (bn, hi) shrink instead of overflowing.
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 132),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          formatClockTime(
                            snapshot.times[prayer]!.hour,
                            snapshot.times[prayer]!.minute,
                            language,
                          ),
                          style: text.labelLarge?.copyWith(
                            color: prayer.isSalah ? p.fg : p.fgMuted,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
