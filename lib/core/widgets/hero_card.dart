import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// A card filled with the palette's heroFrom → heroTo gradient.
///
/// Descendant text and icons default to `onHero`. Use `onHeroMuted` only
/// for large text: it is held to the 3:1 large-text contrast threshold.
class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.radius = 28,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final shape = BorderRadius.circular(radius);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: shape,
        gradient: p.heroGradient,
        border: Border.all(color: p.onHero.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: p.heroFrom.withValues(alpha: p.isDark ? 0.28 : 0.22),
            blurRadius: 48,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: shape,
        child: CustomPaint(
          painter: _HeroSheenPainter(p.onHero),
          child: Padding(
            padding: padding,
            child: DefaultTextStyle.merge(
              style: TextStyle(color: p.onHero),
              child: IconTheme.merge(
                data: IconThemeData(color: p.onHero),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A soft highlight near the top and a faint arch outline, echoing the
/// app's hero card.
class _HeroSheenPainter extends CustomPainter {
  const _HeroSheenPainter(this.ink);

  final Color ink;

  @override
  void paint(Canvas canvas, Size size) {
    final glow = Paint()
      ..shader =
          RadialGradient(
            colors: [ink.withValues(alpha: 0.16), ink.withValues(alpha: 0)],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.5, 0),
              radius: size.width * 0.7,
            ),
          );
    canvas.drawRect(Offset.zero & size, glow);

    final archWidth = size.shortestSide * 0.9;
    final rect = Rect.fromLTWH(
      size.width - archWidth * 0.62,
      size.height - archWidth * 0.95,
      archWidth,
      archWidth * 1.4,
    );
    final arch = Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.width / 2)
      ..arcToPoint(
        Offset(rect.right, rect.top + rect.width / 2),
        radius: Radius.circular(rect.width / 2),
      )
      ..lineTo(rect.right, rect.bottom);
    canvas.drawPath(
      arch,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = ink.withValues(alpha: 0.10),
    );
  }

  @override
  bool shouldRepaint(_HeroSheenPainter old) => old.ink != ink;
}
