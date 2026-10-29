import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_palette.dart';
import '../theme/icon_packs.dart';
import '../theme/theme_controller.dart';

/// A 3D icon from the active pack (or [pack] when given).
///
/// The artwork is shown as-is, never tinted. Switching packs cross-fades.
class IconTile extends ConsumerWidget {
  const IconTile(this.item, {super.key, this.size = 64, this.pack});

  final IconItem item;
  final double size;

  /// Overrides the visitor's active pack, for previews.
  final IconPack? pack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final IconPack resolved = pack ?? ref.watch(activeIconPackProvider);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);
    final image = Image.asset(
      resolved.assetFor(item),
      key: ValueKey(resolved),
      width: size,
      height: size,
      cacheWidth: (size * pixelRatio).ceil(),
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
      excludeFromSemantics: true,
      errorBuilder: (context, error, stackTrace) =>
          _PlaceholderTile(item: item, size: size),
    );
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: AnimatedSwitcher(
          duration: reduceMotion
              ? Duration.zero
              : const Duration(milliseconds: 260),
          child: image,
        ),
      ),
    );
  }
}

/// Shown when an icon asset is missing.
///
/// TODO(assets): add `assets/icons/<pack>/<item>.webp` (see README, "Icon
/// assets") and this placeholder disappears on its own.
class _PlaceholderTile extends StatelessWidget {
  const _PlaceholderTile({required this.item, required this.size});

  final IconItem item;
  final double size;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final hue = (item.index * 30.0) % 360;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HSLColor.fromAHSL(1, hue, 0.6, 0.62).toColor(),
            HSLColor.fromAHSL(1, hue, 0.55, 0.38).toColor(),
          ],
        ),
        border: Border.all(color: p.border),
      ),
      child: Center(
        child: Text(
          item.assetName[0].toUpperCase(),
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: size * 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
