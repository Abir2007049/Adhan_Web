import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_palette.dart';
import '../../core/utils/layout.dart';
import '../../core/widgets/ambient_background.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/pressable.dart';
import 'site_footer.dart';
import 'site_top_bar.dart';

/// Layout for pages other than home: top bar, a back link, a title, the
/// page body in a reading-width column, and the footer.
class SitePage extends StatelessWidget {
  const SitePage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final barHeight = SiteTopBar.heightOf(context);

    return Title(
      title: '$title · ${l10n.appName}',
      color: p.heroFrom,
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(child: AmbientBackground()),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: barHeight),
              child: Column(
                children: [
                  ContentWidth(
                    maxWidth: 760,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _BackLink(label: l10n.backToHome),
                          const SizedBox(height: 20),
                          Semantics(
                            header: true,
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          const SizedBox(height: 24),
                          child,
                        ],
                      ),
                    ),
                  ),
                  const SiteFooter(),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SiteTopBar(onNavigate: (s) => context.go(s.path)),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackLink extends StatelessWidget {
  const _BackLink({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    return Pressable(
      onPressed: () => context.go('/'),
      lift: false,
      borderRadius: BorderRadius.circular(10),
      builder: (context, highlighted) {
        final color = highlighted ? p.fg : p.fgMuted;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GeoIcon(GeoGlyph.chevronStart, size: 18, color: color),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: color),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
