import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import 'geo_icon.dart';
import 'pressable.dart';

/// A circular glass button holding a single [GeoIcon], with a tooltip.
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.glyph,
    required this.label,
    required this.onPressed,
  });

  final GeoGlyph glyph;

  /// Tooltip and accessible name.
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    const radius = BorderRadius.all(Radius.circular(999));
    return Tooltip(
      message: label,
      excludeFromSemantics: true,
      child: Pressable(
        onPressed: onPressed,
        semanticLabel: label,
        borderRadius: radius,
        builder: (context, highlighted) => AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Color.alphaBlend(highlighted ? p.bgElev3 : p.bgElev2, p.bg),
            borderRadius: radius,
            border: Border.all(color: highlighted ? p.borderStrong : p.border),
          ),
          child: Center(child: GeoIcon(glyph, size: 20, color: p.fg)),
        ),
      ),
    );
  }
}
