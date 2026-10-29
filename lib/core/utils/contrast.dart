import 'dart:math' as math;
import 'dart:ui';

/// WCAG 2.x contrast ratio between two opaque colors (1.0 to 21.0).
double contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

/// Flattens a translucent [color] onto an opaque [background].
Color composite(Color color, Color background) =>
    Color.alphaBlend(color, background);

/// Minimum ratio for body text (WCAG AA).
const double kContrastBody = 4.5;

/// Minimum ratio for large text and UI glyphs (WCAG AA).
const double kContrastLarge = 3.0;
