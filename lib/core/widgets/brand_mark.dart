import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// The Muslim Soul logo mark: a mihrab arch with a diamond star on the
/// palette's hero gradient.
///
/// TODO(brand): placeholder mark. Replace with the official logo.
class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 36});

  final double size;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return ExcludeSemantics(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [p.heroFrom, p.heroTo],
          ),
          borderRadius: BorderRadius.circular(size * 0.3),
          border: Border.all(color: p.border),
        ),
        child: CustomPaint(
          size: Size.square(size),
          painter: _ArchPainter(p.onHero),
        ),
      ),
    );
  }
}

class _ArchPainter extends CustomPainter {
  const _ArchPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final u = size.width / 24;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.9 * u
      ..strokeCap = StrokeCap.round;
    final arch = Path()
      ..moveTo(7 * u, 19 * u)
      ..lineTo(7 * u, 12 * u)
      ..quadraticBezierTo(7 * u, 7.5 * u, 12 * u, 5 * u)
      ..quadraticBezierTo(17 * u, 7.5 * u, 17 * u, 12 * u)
      ..lineTo(17 * u, 19 * u);
    final star = Path()
      ..addPolygon([
        Offset(12 * u, 10 * u),
        Offset(14 * u, 12.5 * u),
        Offset(12 * u, 15 * u),
        Offset(10 * u, 12.5 * u),
      ], true);
    canvas
      ..drawPath(arch, stroke)
      ..drawPath(star, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ArchPainter old) => old.color != color;
}
