import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Fades and lifts [child] in the first time it scrolls into view.
///
/// Shows [child] immediately when the visitor prefers reduced motion.
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  ScrollPosition? _position;
  bool _revealed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position?.removeListener(_check);
    _position = Scrollable.maybeOf(context)?.position;
    _position?.addListener(_check);
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_revealed || !mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.attached || !box.hasSize) return;
    final top = box.localToGlobal(Offset.zero).dy;
    if (top < MediaQuery.sizeOf(context).height * 0.92) {
      _position?.removeListener(_check);
      setState(() => _revealed = true);
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_check);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return widget.child;
    return widget.child
        .animate(target: _revealed ? 1 : 0)
        .fadeIn(
          delay: widget.delay,
          duration: 560.ms,
          curve: Curves.easeOutCubic,
        )
        .moveY(begin: 24, end: 0, duration: 560.ms, curve: Curves.easeOutCubic);
  }
}
