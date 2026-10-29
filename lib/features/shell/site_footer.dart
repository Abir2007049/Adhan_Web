import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/language_controller.dart';
import '../../core/theme/app_palette.dart';
import '../../core/utils/layout.dart';
import '../../core/utils/links.dart';
import '../../core/utils/numerals.dart';
import '../../core/widgets/brand_mark.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/pressable.dart';

class SiteFooter extends ConsumerWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;
    final year = localizeDigits(
      '${DateTime.now().year}',
      ref.watch(languageProvider),
    );

    final brand = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BrandMark(size: 32),
            const SizedBox(width: 10),
            Text(l10n.appName, style: text.titleMedium),
          ],
        ),
        const SizedBox(height: 10),
        Text(l10n.appTagline, style: text.bodySmall),
      ],
    );

    final links = Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        _FooterLink(
          label: l10n.footerPrivacy,
          onPressed: () => context.go('/privacy'),
        ),
        _FooterLink(
          label: l10n.footerTerms,
          onPressed: () => context.go('/terms'),
        ),
        _FooterLink(
          label: l10n.footerQibla,
          glyph: GeoGlyph.compass,
          onPressed: () => context.go('/qibla'),
        ),
        _FooterLink(
          label: l10n.footerContact,
          glyph: GeoGlyph.mail,
          onPressed: () => openExternal(Links.contact),
        ),
        _FooterLink(
          label: l10n.footerGithub,
          glyph: GeoGlyph.code,
          onPressed: () => openExternal(Links.github),
        ),
      ],
    );

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: p.divider)),
        ),
        child: ContentWidth(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (context.isMobile) ...[
                  brand,
                  const SizedBox(height: 24),
                  links,
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: brand),
                      Flexible(child: links),
                    ],
                  ),
                const SizedBox(height: 28),
                Text(l10n.footerCopyright(year), style: text.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onPressed, this.glyph});

  final String label;
  final VoidCallback onPressed;
  final GeoGlyph? glyph;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final style = Theme.of(context).textTheme.labelLarge!;
    return Pressable(
      onPressed: onPressed,
      lift: false,
      borderRadius: BorderRadius.circular(10),
      builder: (context, highlighted) {
        final color = highlighted ? p.fg : p.fgMuted;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (glyph != null) ...[
                GeoIcon(glyph!, size: 16, color: color),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(label, style: style.copyWith(color: color)),
              ),
            ],
          ),
        );
      },
    );
  }
}
