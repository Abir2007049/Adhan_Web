import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import '../utils/layout.dart';
import 'geo_icon.dart';

/// A centered section title with a diamond rule and an optional subtitle.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        children: [
          ExcludeSemantics(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 28, height: 1, color: p.accentBorder),
                const SizedBox(width: 10),
                GeoIcon(GeoGlyph.diamond, size: 12, color: p.accent),
                const SizedBox(width: 10),
                Container(width: 28, height: 1, color: p.accentBorder),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            header: true,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.isMobile ? text.headlineSmall : text.headlineLarge,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Text(subtitle!, textAlign: TextAlign.center, style: text.bodyLarge),
          ],
        ],
      ),
    );
  }
}
