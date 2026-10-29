import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/language_controller.dart';
import '../../core/theme/app_palette.dart';
import '../../core/utils/device_location.dart';
import '../../core/utils/numerals.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/pill_button.dart';
import '../shell/site_page.dart';
import 'qibla_math.dart';

/// `/qibla`: the Qibla bearing from typed or detected coordinates,
/// calculated in the browser.
class QiblaPage extends ConsumerStatefulWidget {
  const QiblaPage({super.key});

  @override
  ConsumerState<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends ConsumerState<QiblaPage> {
  final _latitude = TextEditingController();
  final _longitude = TextEditingController();
  QiblaResult? _result;
  String? _error;
  bool _locating = false;

  @override
  void dispose() {
    _latitude.dispose();
    _longitude.dispose();
    super.dispose();
  }

  double? _parse(TextEditingController field) => double.tryParse(
    asciiDigits(field.text.trim()).replaceAll('−', '-').replaceAll(',', '.'),
  );

  void _calculate() {
    final latitude = _parse(_latitude);
    final longitude = _parse(_longitude);
    setState(() {
      if (latitude == null ||
          longitude == null ||
          !isValidCoordinate(latitude, longitude)) {
        _result = null;
        _error = AppLocalizations.of(context).qiblaInvalid;
      } else {
        _result = qiblaFrom(latitude, longitude);
        _error = null;
      }
    });
  }

  Future<void> _useMyLocation() async {
    final l10n = AppLocalizations.of(context);
    setState(() => _locating = true);
    try {
      final here = await ref.read(deviceLocationProvider).current();
      _latitude.text = here.latitude.toStringAsFixed(4);
      _longitude.text = here.longitude.toStringAsFixed(4);
      _calculate();
    } on LocationException catch (e) {
      setState(() {
        _result = null;
        _error = e.denied
            ? l10n.demoErrorPermission
            : l10n.demoErrorUnavailable;
      });
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final language = ref.watch(languageProvider);
    final result = _result;

    Widget field(TextEditingController controller, String label) => TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩۰-۹০-৯०-९.,\-−]')),
      ],
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => _calculate(),
    );

    return SitePage(
      title: l10n.qiblaTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.qiblaSubtitle, style: text.bodyLarge),
          const SizedBox(height: 28),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(
                      width: 240,
                      child: field(_latitude, l10n.qiblaLatitude),
                    ),
                    SizedBox(
                      width: 240,
                      child: field(_longitude, l10n.qiblaLongitude),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    PillButton(
                      label: l10n.qiblaCalculate,
                      glyph: GeoGlyph.compass,
                      onPressed: _calculate,
                    ),
                    PillButton(
                      label: l10n.demoUseLocation,
                      glyph: GeoGlyph.locate,
                      variant: PillVariant.secondary,
                      onPressed: _locating ? null : _useMyLocation,
                    ),
                  ],
                ),
                if (_error != null) ...[
                  const SizedBox(height: 16),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      _error!,
                      style: text.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (result != null) ...[
            const SizedBox(height: 24),
            GlassCard(
              child: Semantics(
                liveRegion: true,
                child: Column(
                  children: [
                    ExcludeSemantics(
                      child: SizedBox.square(
                        dimension: 220,
                        child: CustomPaint(
                          painter: _QiblaDialPainter(
                            bearing: result.bearing,
                            palette: context.palette,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.qiblaResult(
                        localizeDigits(
                          result.bearing.toStringAsFixed(1),
                          language,
                        ),
                      ),
                      style: text.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.qiblaDistance(
                        localizeDigits(
                          '${result.distanceKm.round()}',
                          language,
                        ),
                      ),
                      style: text.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.qiblaHint,
                      style: text.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A north-up dial with a needle pointing along [bearing]. Geographic, so
/// never mirrored in right-to-left layouts.
class _QiblaDialPainter extends CustomPainter {
  const _QiblaDialPainter({required this.bearing, required this.palette});

  final double bearing;
  final AppPalette palette;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 4;
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = palette.borderStrong;
    canvas.drawCircle(center, radius, ring);

    for (var degrees = 0; degrees < 360; degrees += 15) {
      final angle = degrees * math.pi / 180;
      final major = degrees % 90 == 0;
      final direction = Offset(math.sin(angle), -math.cos(angle));
      canvas.drawLine(
        center + direction * (radius - (major ? 14 : 7)),
        center + direction * radius,
        Paint()
          ..strokeWidth = major ? 2 : 1
          ..color = major ? palette.fg : palette.fgFaint,
      );
    }

    // North marker.
    final north = center + Offset(0, -radius + 26);
    canvas.drawPath(
      Path()..addPolygon([
        north + const Offset(0, -7),
        north + const Offset(6, 0),
        north + const Offset(0, 7),
        north + const Offset(-6, 0),
      ], true),
      Paint()..color = palette.fg,
    );

    // Needle toward the Kaaba.
    final angle = bearing * math.pi / 180;
    final direction = Offset(math.sin(angle), -math.cos(angle));
    final tip = center + direction * (radius - 22);
    canvas
      ..drawLine(
        center,
        tip,
        Paint()
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..color = palette.accent,
      )
      ..drawRect(
        Rect.fromCenter(center: tip, width: 14, height: 14),
        Paint()..color = palette.accent,
      )
      ..drawCircle(center, 6, Paint()..color = palette.fg);
  }

  @override
  bool shouldRepaint(_QiblaDialPainter old) =>
      old.bearing != bearing || old.palette != palette;
}
