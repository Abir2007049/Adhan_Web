import 'package:flutter/material.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/utils/layout.dart';
import '../../../core/widgets/geo_icon.dart';
import '../../../core/widgets/round_icon_button.dart';
import '../../../core/widgets/section_header.dart';

typedef _Shot = ({String asset, String caption});

/// A horizontal carousel of app screenshots. Images load only when their
/// slide is built, and the carousel runs right to left in RTL languages.
///
/// TODO(assets): replace the files in `assets/screenshots/` with clean
/// marketing captures (no personal status bar or location).
class ScreenshotsSection extends StatefulWidget {
  const ScreenshotsSection({super.key});

  @override
  State<ScreenshotsSection> createState() => _ScreenshotsSectionState();
}

class _ScreenshotsSectionState extends State<ScreenshotsSection> {
  final _scroll = ScrollController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_trackIndex);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  double get _extent => (context.isMobile ? 210.0 : 252.0) + _gap;
  static const _gap = 20.0;

  void _trackIndex() {
    final index = (_scroll.offset / _extent).round();
    if (index != _index) setState(() => _index = index);
  }

  void _step(int delta, int count) {
    final target = (_index + delta).clamp(0, count - 1) * _extent;
    final offset = target.clamp(0.0, _scroll.position.maxScrollExtent);
    if (MediaQuery.disableAnimationsOf(context)) {
      _scroll.jumpTo(offset);
    } else {
      _scroll.animateTo(
        offset,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final List<_Shot> shots = [
      (asset: '01_home', caption: l10n.shotHome),
      (asset: '02_prayer_times', caption: l10n.navPrayerTimes),
      (asset: '03_qibla', caption: l10n.featureQiblaTitle),
      (asset: '04_qibla_styles', caption: l10n.shotCompassStyles),
      (asset: '05_quran', caption: l10n.featureQuranTitle),
      (asset: '06_mosques', caption: l10n.featureMosquesTitle),
      (asset: '07_more', caption: l10n.shotMore),
    ];
    final width = _extent - _gap;
    final height = width / 0.45; // Screenshots are 720 × 1600.
    final cacheWidth = (width * MediaQuery.devicePixelRatioOf(context)).ceil();

    return Column(
      children: [
        SectionHeader(
          title: l10n.screenshotsTitle,
          subtitle: l10n.screenshotsSubtitle,
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: height + 44,
          child: ListView.separated(
            controller: _scroll,
            scrollDirection: Axis.horizontal,
            itemCount: shots.length,
            separatorBuilder: (_, _) => const SizedBox(width: _gap),
            itemBuilder: (context, i) => SizedBox(
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B0B12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: p.border),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/screenshots/${shots[i].asset}.jpg',
                        fit: BoxFit.cover,
                        cacheWidth: cacheWidth,
                        semanticLabel: shots[i].caption,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ExcludeSemantics(
                    child: Text(
                      shots[i].caption,
                      style: Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              glyph: GeoGlyph.chevronStart,
              label: l10n.screenshotPrevious,
              onPressed: _index > 0 ? () => _step(-1, shots.length) : null,
            ),
            const SizedBox(width: 16),
            ExcludeSemantics(
              child: Row(
                children: [
                  for (var i = 0; i < shots.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: i == _index ? 18 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: i == _index ? p.accent : p.borderStrong,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            RoundIconButton(
              glyph: GeoGlyph.chevronEnd,
              label: l10n.screenshotNext,
              onPressed: _index < shots.length - 1
                  ? () => _step(1, shots.length)
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
