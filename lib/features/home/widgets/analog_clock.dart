import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// The big clock on the Salah card, painted in [ink] for a hero gradient.
class AnalogClock extends StatelessWidget {
  const AnalogClock({
    super.key,
    required this.time,
    required this.ink,
    this.size = 112,
  });

  final DateTime time;
  final Color ink;
  final double size;

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: CustomPaint(
      size: Size.square(size),
      painter: _ClockPainter(time.hour, time.minute, time.second, ink),
    ),
  );
}

class _ClockPainter extends CustomPainter {
  const _ClockPainter(this.hour, this.minute, this.second, this.ink);

  final int hour;
  final int minute;
  final int second;
  final Color ink;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.shortestSide / 2;
    Paint line(double width, double alpha) => Paint()
      ..color = ink.withValues(alpha: alpha)
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
    Offset at(double fraction, double length) {
      final a = fraction * 2 * math.pi;
      return c + Offset(math.sin(a), -math.cos(a)) * length;
    }

    canvas
      ..drawCircle(c, r - 1, Paint()..color = const Color(0x40000000))
      ..drawCircle(c, r - 1, line(2, 0.35)..style = PaintingStyle.stroke);

    for (var i = 0; i < 60; i++) {
      final hourMark = i % 5 == 0;
      canvas.drawLine(
        at(i / 60, r - (hourMark ? 13 : 8)),
        at(i / 60, r - 5),
        hourMark ? line(2, 0.9) : line(1, 0.35),
      );
    }

    // A diamond at twelve instead of a numeral.
    final top = c + Offset(0, -r + 22);
    canvas.drawPath(
      Path()..addPolygon([
        top + const Offset(0, -4),
        top + const Offset(4, 0),
        top + const Offset(0, 4),
        top + const Offset(-4, 0),
      ], true),
      Paint()..color = ink,
    );

    final minuteFraction = (minute + second / 60) / 60;
    final hourFraction = ((hour % 12) + minuteFraction) / 12;
    canvas
      ..drawLine(c, at(hourFraction, r * 0.48), line(4, 1))
      ..drawLine(c, at(minuteFraction, r * 0.7), line(3, 1))
      ..drawLine(
        at(second / 60 + 0.5, r * 0.14),
        at(second / 60, r * 0.78),
        line(1.4, 0.75),
      )
      ..drawCircle(c, 4, Paint()..color = ink);
  }

  @override
  bool shouldRepaint(_ClockPainter old) =>
      old.second != second ||
      old.minute != minute ||
      old.hour != hour ||
      old.ink != ink;
}
