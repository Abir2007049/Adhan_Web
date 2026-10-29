import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import 'geo_icon.dart';
import 'pressable.dart';

enum PillVariant {
  /// Accent fill. For the main action.
  primary,

  /// Elevated surface with a hairline border.
  secondary,

  /// Translucent white for use on a hero gradient.
  onHero,
}

/// A fully rounded button with an optional leading glyph.
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = PillVariant.primary,
    this.glyph,
    this.dense = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final PillVariant variant;
  final GeoGlyph? glyph;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final textStyle = Theme.of(context).textTheme.labelLarge!;
    const radius = BorderRadius.all(Radius.circular(999));

    return Pressable(
      onPressed: onPressed,
      borderRadius: radius,
      builder: (context, highlighted) {
        final (fill, border, ink) = switch (variant) {
          PillVariant.primary => (
            highlighted ? p.accentStrong : p.accent,
            p.accentBorder,
            p.onAccent,
          ),
          PillVariant.secondary => (
            Color.alphaBlend(highlighted ? p.bgElev3 : p.bgElev2, p.bg),
            highlighted ? p.borderStrong : p.border,
            p.fg,
          ),
          PillVariant.onHero => (
            p.onHero.withValues(alpha: highlighted ? 0.22 : 0.14),
            p.onHero.withValues(alpha: 0.28),
            p.onHero,
          ),
        };
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(
            horizontal: dense ? 16 : 22,
            vertical: dense ? 10 : 14,
          ),
          decoration: BoxDecoration(
            color: onPressed == null ? fill.withValues(alpha: 0.5) : fill,
            borderRadius: radius,
            border: Border.all(color: border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (glyph != null) ...[
                GeoIcon(glyph!, size: 18, color: ink),
                const SizedBox(width: 10),
              ],
              Flexible(
                child: Text(
                  label,
                  style: textStyle.copyWith(color: ink),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
