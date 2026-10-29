import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/app_language.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/language_controller.dart';
import '../../core/theme/app_palette.dart';
import '../../core/typography/app_typography.dart';
import '../../core/utils/device_location.dart';
import '../../core/utils/layout.dart';
import '../../core/utils/numerals.dart';
import '../../core/utils/time_format.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/pill_button.dart';
import '../../core/widgets/section_header.dart';
import 'data/aladhan_client.dart';
import 'data/demo_city.dart';
import 'domain/prayer.dart';
import 'prayer_demo_controller.dart';

/// Live demo: the visitor shares their location or picks a city and sees
/// today's prayer times from the Aladhan API.
class PrayerDemoSection extends ConsumerWidget {
  const PrayerDemoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(prayerDemoProvider);
    final controller = ref.read(prayerDemoProvider.notifier);
    final loading = state.result?.isLoading ?? false;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Column(
      children: [
        SectionHeader(title: l10n.demoTitle, subtitle: l10n.demoSubtitle),
        const SizedBox(height: 40),
        Container(
          constraints: const BoxConstraints(maxWidth: 920),
          width: double.infinity,
          child: GlassCard(
            padding: EdgeInsets.all(context.isMobile ? 20 : 32),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    PillButton(
                      label: l10n.demoUseLocation,
                      glyph: GeoGlyph.locate,
                      onPressed: loading ? null : controller.useMyLocation,
                    ),
                    _CityPicker(
                      selected: state.city,
                      onSelected: controller.chooseCity,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                AnimatedSize(
                  duration: reduceMotion
                      ? Duration.zero
                      : const Duration(milliseconds: 260),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.topCenter,
                  child: Semantics(
                    liveRegion: true,
                    child: switch (state.result) {
                      null => _Message(
                        glyph: GeoGlyph.location,
                        text: l10n.demoIdle,
                      ),
                      AsyncData(:final value) => _Times(
                        day: value,
                        place: state.city?.label(l10n) ?? l10n.demoMyLocation,
                      ),
                      AsyncError(:final error) => _Failure(
                        message: _errorMessage(error, l10n),
                        onRetry: controller.retry,
                      ),
                      _ => const _Loading(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static String _errorMessage(Object error, AppLocalizations l10n) =>
      switch (error) {
        LocationException(denied: true) => l10n.demoErrorPermission,
        LocationException() => l10n.demoErrorUnavailable,
        _ => l10n.demoErrorNetwork,
      };
}

class _CityPicker extends StatelessWidget {
  const _CityPicker({required this.selected, required this.onSelected});

  final DemoCity? selected;
  final ValueChanged<DemoCity> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MenuAnchor(
      menuChildren: [
        for (final city in DemoCity.values)
          Semantics(
            selected: city == selected,
            child: MenuItemButton(
              onPressed: () => onSelected(city),
              child: Text(city.label(l10n)),
            ),
          ),
      ],
      builder: (context, controller, _) => PillButton(
        label: selected?.label(l10n) ?? l10n.demoChooseCity,
        glyph: GeoGlyph.location,
        variant: PillVariant.secondary,
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.glyph, required this.text, this.color});

  final GeoGlyph glyph;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GeoIcon(glyph, size: 32, color: color ?? p.fgMuted),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 28,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
          const SizedBox(height: 14),
          Text(
            AppLocalizations.of(context).demoLoading,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  const _Failure({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Message(
          glyph: GeoGlyph.close,
          text: message,
          color: Theme.of(context).colorScheme.error,
        ),
        PillButton(
          label: AppLocalizations.of(context).demoRetry,
          variant: PillVariant.secondary,
          dense: true,
          onPressed: onRetry,
        ),
      ],
    );
  }
}

class _Times extends ConsumerWidget {
  const _Times({required this.day, required this.place});

  final PrayerDay day;
  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final language = ref.watch(languageProvider);
    final text = Theme.of(context).textTheme;
    final gregorian = MaterialLocalizations.of(
      context,
    ).formatFullDate(day.date);
    final hijriMonth = language.isRtl ? day.hijriMonthAr : day.hijriMonthEn;
    final dateLine = localizeDigits(
      '$gregorian · ${day.hijriDay} $hijriMonth ${day.hijriYear}',
      language,
    );
    final columns = switch (context.screenSize) {
      ScreenSize.mobile => 2,
      ScreenSize.tablet => 3,
      ScreenSize.desktop => 6,
    };

    return Column(
      children: [
        Text(place, style: text.titleLarge, textAlign: TextAlign.center),
        const SizedBox(height: 4),
        Text(dateLine, style: text.bodySmall, textAlign: TextAlign.center),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            const gap = 12.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final prayer in Prayer.values)
                  SizedBox(
                    width: width,
                    child: _TimeTile(
                      prayer: prayer,
                      time: day.times[prayer]!,
                      language: language,
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          '${l10n.demoMethod(day.method)} · ${l10n.demoTimezone(day.timezone)}',
          style: text.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          l10n.demoSource,
          style: text.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({
    required this.prayer,
    required this.time,
    required this.language,
  });

  final Prayer prayer;
  final ClockTime time;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      radius: 18,
      fill: p.bgElev2,
      child: Column(
        children: [
          Text(
            prayer.label(l10n),
            style: text.titleSmall?.copyWith(
              color: prayer.isSalah ? p.fg : p.fgMuted,
            ),
          ),
          if (language != AppLanguage.ar)
            Text(
              prayer.arabicName,
              textDirection: TextDirection.rtl,
              style: AppTypography.arabicUi(text.bodySmall!),
            ),
          const SizedBox(height: 10),
          Text(
            formatClockTime(time.hour, time.minute, language),
            style: text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
