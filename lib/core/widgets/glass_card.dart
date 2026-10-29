import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// A surface card: `bgElev1` fill, 1 px hairline border, rounded corners.
///
/// On glass palettes (translucent `bgElev*`) the backdrop is blurred. Opaque
/// palettes draw the same card flat. Requires a [BackdropGroup] ancestor,
/// which the app provides, so all cards share one backdrop pass.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.radius = 24,
    this.fill,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  /// Defaults to `bgElev1`.
  final Color? fill;

  /// Defaults to `border`.
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final shape = BorderRadius.circular(radius);
    final card = DecoratedBox(
      decoration: BoxDecoration(
        color: fill ?? p.bgElev1,
        borderRadius: shape,
        border: Border.all(color: borderColor ?? p.border),
        boxShadow: p.isDark
            ? null
            : [
                BoxShadow(
                  color: p.fg.withValues(alpha: 0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: Padding(padding: padding, child: child),
    );
    if (!p.isGlass) return card;
    return ClipRRect(
      borderRadius: shape,
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: card,
      ),
    );
  }
}
