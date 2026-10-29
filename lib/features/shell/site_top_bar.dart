import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/app_language.dart';
import '../../core/l10n/generated/app_localizations.dart';
import '../../core/l10n/language_controller.dart';
import '../../core/theme/app_palette.dart';
import '../../core/theme/theme_controller.dart';
import '../../core/typography/app_typography.dart';
import '../../core/utils/layout.dart';
import '../../core/widgets/brand_mark.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/pill_button.dart';
import '../../core/widgets/pressable.dart';
import '../../core/widgets/round_icon_button.dart';
import '../home/home_section.dart';
import 'theme_mode_pills.dart';

const _navSections = [
  HomeSection.features,
  HomeSection.prayerTimes,
  HomeSection.themes,
  HomeSection.languages,
  HomeSection.faq,
];

String _navLabel(HomeSection section, AppLocalizations l10n) =>
    switch (section) {
      HomeSection.features => l10n.navFeatures,
      HomeSection.prayerTimes => l10n.navPrayerTimes,
      HomeSection.themes => l10n.navThemes,
      HomeSection.languages => l10n.navLanguages,
      HomeSection.faq => l10n.navFaq,
      _ => l10n.getTheApp,
    };

/// The sticky top bar: logo, section links, language and appearance menus,
/// and "Get the app". Collapses into a menu sheet below desktop width.
class SiteTopBar extends StatelessWidget {
  const SiteTopBar({super.key, required this.onNavigate});

  /// Called with the section a link points at.
  final ValueChanged<HomeSection> onNavigate;

  static double heightOf(BuildContext context) => context.isMobile ? 64 : 76;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final l10n = AppLocalizations.of(context);
    final size = context.screenSize;

    return ClipRect(
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: heightOf(context),
          decoration: BoxDecoration(
            color: p.bg.withValues(alpha: 0.74),
            border: Border(bottom: BorderSide(color: p.divider)),
          ),
          child: ContentWidth(
            child: Row(
              children: [
                const _Brand(),
                if (size == ScreenSize.desktop) ...[
                  // Long translations shrink the links rather than overflow.
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            for (final section in _navSections)
                              _NavLink(
                                label: _navLabel(section, l10n),
                                onPressed: () => onNavigate(section),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ] else
                  const Spacer(),
                const _LanguageMenu(),
                if (size != ScreenSize.mobile) ...[
                  const SizedBox(width: 8),
                  const _ThemeModeMenu(),
                  const SizedBox(width: 12),
                  PillButton(
                    label: l10n.getTheApp,
                    dense: true,
                    onPressed: () => onNavigate(HomeSection.download),
                  ),
                ],
                if (size != ScreenSize.desktop) ...[
                  const SizedBox(width: 8),
                  RoundIconButton(
                    glyph: GeoGlyph.menu,
                    label: l10n.openMenu,
                    onPressed: () => _MobileMenu.show(context, onNavigate),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Pressable(
      onPressed: () => context.go('/'),
      semanticLabel: l10n.appName,
      lift: false,
      borderRadius: BorderRadius.circular(12),
      builder: (context, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BrandMark(),
          const SizedBox(width: 10),
          Text(
            l10n.appName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    final style = Theme.of(context).textTheme.labelLarge!;
    return Pressable(
      onPressed: onPressed,
      lift: false,
      borderRadius: BorderRadius.circular(10),
      builder: (context, highlighted) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: style.copyWith(color: highlighted ? p.fg : p.fgMuted),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 2,
              width: highlighted ? 18 : 0,
              color: p.accent,
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageMenu extends ConsumerWidget {
  const _LanguageMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(languageProvider);
    final style = Theme.of(context).textTheme.labelLarge!;
    return MenuAnchor(
      menuChildren: [
        for (final language in AppLanguage.values)
          _MenuChoice(
            selected: language == current,
            onPressed: () =>
                ref.read(languageProvider.notifier).select(language),
            child: Text(
              language.nativeName,
              textDirection: language.textDirection,
              style: AppTypography.forLanguage(style, language),
            ),
          ),
      ],
      builder: (context, controller, _) => RoundIconButton(
        glyph: GeoGlyph.language,
        label: l10n.languageMenuLabel,
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
      ),
    );
  }
}

class _ThemeModeMenu extends ConsumerWidget {
  const _ThemeModeMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(themeModeProvider);
    return MenuAnchor(
      menuChildren: [
        for (final mode in ThemeMode.values)
          _MenuChoice(
            selected: mode == current,
            onPressed: () => ref.read(themeModeProvider.notifier).select(mode),
            child: Row(
              children: [
                GeoIcon(themeModeGlyph(mode), size: 18),
                const SizedBox(width: 10),
                Text(themeModeLabel(mode, l10n)),
              ],
            ),
          ),
      ],
      builder: (context, controller, _) => RoundIconButton(
        glyph: themeModeGlyph(current),
        label: '${l10n.themeModeLabel}: ${themeModeLabel(current, l10n)}',
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
      ),
    );
  }
}

/// A menu row with a check mark on the selected choice.
class _MenuChoice extends StatelessWidget {
  const _MenuChoice({
    required this.selected,
    required this.onPressed,
    required this.child,
  });

  final bool selected;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      child: MenuItemButton(
        onPressed: onPressed,
        trailingIcon: selected
            ? GeoIcon(GeoGlyph.check, size: 18, color: context.palette.accent)
            : const SizedBox(width: 18),
        child: child,
      ),
    );
  }
}

/// The section links, appearance choice and "Get the app" for narrow
/// screens, in a bottom sheet.
class _MobileMenu extends StatelessWidget {
  const _MobileMenu({required this.onNavigate});

  final ValueChanged<HomeSection> onNavigate;

  static void show(BuildContext context, ValueChanged<HomeSection> onNavigate) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _MobileMenu(onNavigate: onNavigate),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = context.palette;
    final text = Theme.of(context).textTheme;

    void go(HomeSection section) {
      Navigator.of(context).pop();
      onNavigate(section);
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final section in _navSections)
              Pressable(
                onPressed: () => go(section),
                lift: false,
                borderRadius: BorderRadius.circular(14),
                builder: (context, highlighted) => AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: highlighted ? p.accentSoft : null,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _navLabel(section, l10n),
                          style: text.titleMedium,
                        ),
                      ),
                      GeoIcon(GeoGlyph.chevronEnd, size: 18, color: p.fgMuted),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(l10n.themeModeLabel, style: text.labelMedium),
            const SizedBox(height: 10),
            const ThemeModePills(),
            const SizedBox(height: 20),
            PillButton(
              label: l10n.getTheApp,
              onPressed: () => go(HomeSection.download),
            ),
          ],
        ),
      ),
    );
  }
}
