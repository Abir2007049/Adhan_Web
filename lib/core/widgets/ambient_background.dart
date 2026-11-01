import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// The page canvas: `bg` with soft glows from the hero and accent colors.
/// Glass cards blur whatever of this shows through them.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final strength = p.isDark ? 1.0 : 0.5;
    Widget glow(Alignment at, Color color, double alpha) => Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: at,
            radius: 0.9,
            colors: [
              color.withValues(alpha: alpha * strength),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
    return IgnorePointer(
      child: ColoredBox(
        color: p.bg,
        child: Stack(
          children: [
            glow(const Alignment(-0.7, -1.1), p.heroFrom, 0.20),
            glow(const Alignment(1.1, 0.2), p.accent, 0.06),
            glow(const Alignment(-0.9, 1.2), p.heroTo, 0.16),
          ],
        ),
      ),
    );
  }
}
