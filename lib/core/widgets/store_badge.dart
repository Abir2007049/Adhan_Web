import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/links.dart';
import 'geo_icon.dart';
import 'pressable.dart';

/// A "Get it on Google Play" badge, drawn in the house style.
///
/// TODO(launch): links to the placeholder [Links.playStore]. Before
/// publishing, consider swapping in Google's official badge artwork, which
/// has its own usage guidelines.
class StoreBadge extends StatelessWidget {
  const StoreBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    const ink = Color(0xFFFFFFFF);
    const radius = BorderRadius.all(Radius.circular(16));
    return Pressable(
      onPressed: () => openExternal(Links.playStore),
      semanticLabel: '${l10n.playBadgeTop} Google Play',
      borderRadius: radius,
      builder: (context, highlighted) => AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 22, 10),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0B12),
          borderRadius: radius,
          border: Border.all(
            color: ink.withValues(alpha: highlighted ? 0.5 : 0.22),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GeoIcon(GeoGlyph.play, size: 26, color: ink),
            const SizedBox(width: 12),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.playBadgeTop,
                      style: text.labelSmall?.copyWith(color: ink),
                    ),
                    Text(
                      'Google Play',
                      style: text.titleLarge?.copyWith(
                        color: ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
