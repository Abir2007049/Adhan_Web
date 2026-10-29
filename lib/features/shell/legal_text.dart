import 'package:flutter/material.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_palette.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/glass_card.dart';

/// Body of the privacy and terms pages: a placeholder warning, then
/// [paragraphs].
///
/// TODO(legal): the copy is placeholder text and must be replaced with
/// reviewed policies before launch.
class LegalText extends StatelessWidget {
  const LegalText({super.key, required this.paragraphs});

  final List<String> paragraphs;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          radius: 16,
          fill: p.accentSoft,
          borderColor: p.accentBorder,
          child: Row(
            children: [
              GeoIcon(GeoGlyph.diamond, size: 14, color: p.accent),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  AppLocalizations.of(context).placeholderNotice,
                  style: text.labelLarge,
                ),
              ),
            ],
          ),
        ),
        for (final paragraph in paragraphs) ...[
          const SizedBox(height: 20),
          Text(paragraph, style: text.bodyLarge),
        ],
      ],
    );
  }
}
