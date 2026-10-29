import 'dart:math' as math;

import 'package:flutter/material.dart';

/// UI glyphs in the app's geometric outline style: arches and diamonds.
enum GeoGlyph {
  menu,
  close,
  chevronStart(directional: true),
  chevronEnd(directional: true),
  chevronDown,
  arrowEnd(directional: true),
  language,
  sun,
  moon,
  system,
  location,
  locate,
  check,
  diamond,
  mail,
  code,
  play,
  compass;

  const GeoGlyph({this.directional = false});

  /// Directional glyphs mirror in right-to-left layouts.
  final bool directional;
}

/// Paints a [GeoGlyph] on a 24-unit grid at [size], in [color] (defaults to
/// the ambient [IconTheme] color).
class GeoIcon extends StatelessWidget {
  const GeoIcon(
    this.glyph, {
    super.key,
    this.size = 22,
    this.color,
    this.semanticLabel,
  });

  final GeoGlyph glyph;
  final double size;
  final Color? color;

  /// Leave null for decorative glyphs next to a text label.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mirror =
        glyph.directional && Directionality.of(context) == TextDirection.rtl;
    final icon = CustomPaint(
      size: Size.square(size),
      painter: _GeoPainter(
        glyph,
        color ?? IconTheme.of(context).color ?? const Color(0xFF000000),
        mirror,
      ),
    );
    return semanticLabel == null
        ? ExcludeSemantics(child: icon)
        : Semantics(label: semanticLabel, image: true, child: icon);
  }
}

class _GeoPainter extends CustomPainter {
  const _GeoPainter(this.glyph, this.color, this.mirror);

  final GeoGlyph glyph;
  final Color color;
  final bool mirror;

  @override
  void paint(Canvas canvas, Size size) {
    final unit = size.width / 24;
    canvas.save();
    if (mirror) {
      canvas
        ..translate(size.width, 0)
        ..scale(-1, 1);
    }
    canvas.scale(unit);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final fill = Paint()..color = color;

    Path poly(List<Offset> points, {bool close = false}) {
      final path = Path()..addPolygon(points, close);
      return path;
    }

    Path diamond(Offset c, double r) => poly([
      Offset(c.dx, c.dy - r),
      Offset(c.dx + r, c.dy),
      Offset(c.dx, c.dy + r),
      Offset(c.dx - r, c.dy),
    ], close: true);

    switch (glyph) {
      case GeoGlyph.menu:
        canvas
          ..drawLine(const Offset(4, 7), const Offset(20, 7), stroke)
          ..drawLine(const Offset(4, 12), const Offset(14, 12), stroke)
          ..drawLine(const Offset(4, 17), const Offset(20, 17), stroke)
          ..drawPath(diamond(const Offset(19, 12), 2), fill);
      case GeoGlyph.close:
        canvas
          ..drawLine(const Offset(6, 6), const Offset(18, 18), stroke)
          ..drawLine(const Offset(18, 6), const Offset(6, 18), stroke);
      case GeoGlyph.chevronEnd:
        canvas.drawPath(
          poly(const [Offset(9, 5), Offset(16, 12), Offset(9, 19)]),
          stroke,
        );
      case GeoGlyph.chevronStart:
        canvas.drawPath(
          poly(const [Offset(15, 5), Offset(8, 12), Offset(15, 19)]),
          stroke,
        );
      case GeoGlyph.chevronDown:
        canvas.drawPath(
          poly(const [Offset(6, 9), Offset(12, 15), Offset(18, 9)]),
          stroke,
        );
      case GeoGlyph.arrowEnd:
        canvas
          ..drawLine(const Offset(4, 12), const Offset(19, 12), stroke)
          ..drawPath(
            poly(const [Offset(13, 6), Offset(19, 12), Offset(13, 18)]),
            stroke,
          );
      case GeoGlyph.language:
        canvas
          ..drawCircle(const Offset(12, 12), 9, stroke)
          ..drawPath(
            Path()
              ..moveTo(12, 3)
              ..quadraticBezierTo(5.5, 12, 12, 21)
              ..moveTo(12, 3)
              ..quadraticBezierTo(18.5, 12, 12, 21),
            stroke,
          )
          ..drawLine(const Offset(3.5, 12), const Offset(20.5, 12), stroke);
      case GeoGlyph.sun:
        canvas.drawCircle(const Offset(12, 12), 4, stroke);
        for (var i = 0; i < 8; i++) {
          final a = i * math.pi / 4;
          canvas.drawLine(
            Offset(12 + 7 * math.cos(a), 12 + 7 * math.sin(a)),
            Offset(12 + 9.5 * math.cos(a), 12 + 9.5 * math.sin(a)),
            stroke,
          );
        }
      case GeoGlyph.moon:
        final crescent = Path.combine(
          PathOperation.difference,
          Path()
            ..addOval(Rect.fromCircle(center: const Offset(12, 12), radius: 8)),
          Path()..addOval(
            Rect.fromCircle(center: const Offset(16, 9), radius: 6.5),
          ),
        );
        canvas
          ..drawPath(crescent, stroke)
          ..drawPath(diamond(const Offset(18.5, 16), 1.6), fill);
      case GeoGlyph.system:
        canvas
          ..drawCircle(const Offset(12, 12), 8.5, stroke)
          ..drawPath(
            Path()
              ..moveTo(12, 3.5)
              ..arcToPoint(
                const Offset(12, 20.5),
                radius: const Radius.circular(8.5),
                clockwise: false,
              )
              ..close(),
            fill,
          );
      case GeoGlyph.location:
        canvas
          ..drawPath(
            Path()
              ..moveTo(6, 20)
              ..lineTo(6, 10)
              ..arcToPoint(
                const Offset(18, 10),
                radius: const Radius.circular(6),
              )
              ..lineTo(18, 20),
            stroke,
          )
          ..drawLine(const Offset(3, 20), const Offset(21, 20), stroke)
          ..drawPath(diamond(const Offset(12, 11), 2.4), fill);
      case GeoGlyph.locate:
        canvas
          ..drawCircle(const Offset(12, 12), 7, stroke)
          ..drawPath(diamond(const Offset(12, 12), 2.2), fill);
        for (final (a, b) in const [
          (Offset(12, 2), Offset(12, 5)),
          (Offset(12, 19), Offset(12, 22)),
          (Offset(2, 12), Offset(5, 12)),
          (Offset(19, 12), Offset(22, 12)),
        ]) {
          canvas.drawLine(a, b, stroke);
        }
      case GeoGlyph.check:
        canvas.drawPath(
          poly(const [Offset(5, 12.5), Offset(10, 17), Offset(19, 7)]),
          stroke,
        );
      case GeoGlyph.diamond:
        canvas.drawPath(diamond(const Offset(12, 12), 6), fill);
      case GeoGlyph.mail:
        canvas
          ..drawRRect(
            RRect.fromLTRBR(3, 5.5, 21, 18.5, const Radius.circular(3)),
            stroke,
          )
          ..drawPath(
            poly(const [Offset(4, 7), Offset(12, 13), Offset(20, 7)]),
            stroke,
          );
      case GeoGlyph.code:
        canvas
          ..drawPath(
            poly(const [Offset(8, 7), Offset(3, 12), Offset(8, 17)]),
            stroke,
          )
          ..drawPath(
            poly(const [Offset(16, 7), Offset(21, 12), Offset(16, 17)]),
            stroke,
          )
          ..drawLine(const Offset(14, 5), const Offset(10, 19), stroke);
      case GeoGlyph.play:
        canvas.drawPath(
          poly(const [
            Offset(6.5, 4),
            Offset(19, 12),
            Offset(6.5, 20),
          ], close: true),
          stroke,
        );
      case GeoGlyph.compass:
        canvas
          ..drawCircle(const Offset(12, 12), 9, stroke)
          ..drawPath(
            poly(const [
              Offset(12, 5),
              Offset(14.5, 12),
              Offset(12, 19),
              Offset(9.5, 12),
            ], close: true),
            stroke,
          )
          ..drawPath(
            poly(const [
              Offset(12, 5),
              Offset(14.5, 12),
              Offset(9.5, 12),
            ], close: true),
            fill,
          );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GeoPainter old) =>
      old.glyph != glyph || old.color != color || old.mirror != mirror;
}
