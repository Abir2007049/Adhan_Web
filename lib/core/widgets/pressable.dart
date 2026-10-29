import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// Builds a pressable surface. [highlighted] is true while hovered or
/// keyboard-focused, so surfaces can brighten their border or fill.
typedef PressableBuilder =
    Widget Function(BuildContext context, bool highlighted);

/// Shared interaction wrapper for cards, tiles and buttons.
///
/// Provides button semantics, a pointer cursor, Enter/Space activation, a
/// visible keyboard focus ring, and hover-lift / press-sink motion that turns
/// off when the visitor prefers reduced motion.
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.onPressed,
    required this.builder,
    this.semanticLabel,
    this.selected,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.lift = true,
  });

  final VoidCallback? onPressed;
  final PressableBuilder builder;

  /// Replaces the children's semantics when set.
  final String? semanticLabel;

  /// Exposed to assistive tech for single-choice pickers.
  final bool? selected;
  final BorderRadius borderRadius;

  /// Whether to scale up slightly on hover.
  final bool lift;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _hovered = false;
  bool _focused = false;
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final scale = reduceMotion
        ? 1.0
        : _pressed
        ? 0.97
        : _hovered && widget.lift
        ? 1.02
        : 1.0;

    return Semantics(
      container: true,
      button: true,
      enabled: _enabled,
      selected: widget.selected,
      label: widget.semanticLabel,
      excludeSemantics: widget.semanticLabel != null,
      child: FocusableActionDetector(
        enabled: _enabled,
        mouseCursor: _enabled ? SystemMouseCursors.click : MouseCursor.defer,
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onPressed?.call();
              return null;
            },
          ),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: _enabled ? (_) => _setPressed(true) : null,
          onTapUp: _enabled ? (_) => _setPressed(false) : null,
          onTapCancel: _enabled ? () => _setPressed(false) : null,
          onTap: widget.onPressed,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            child: FocusRing(
              visible: _focused,
              borderRadius: widget.borderRadius,
              child: widget.builder(context, _hovered || _focused),
            ),
          ),
        ),
      ),
    );
  }
}

/// Draws a 2 px outline just outside [child] when [visible].
class FocusRing extends StatelessWidget {
  const FocusRing({
    super.key,
    required this.visible,
    required this.borderRadius,
    required this.child,
  });

  final bool visible;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const gap = 4.0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (visible)
          Positioned.fill(
            left: -gap,
            top: -gap,
            right: -gap,
            bottom: -gap,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: borderRadius + BorderRadius.circular(gap),
                  border: Border.all(
                    color: context.palette.focusRing,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
