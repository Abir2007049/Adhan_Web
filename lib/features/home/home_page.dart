import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/app_palette.dart';
import '../../core/utils/layout.dart';
import '../../core/widgets/ambient_background.dart';
import '../../core/widgets/scroll_reveal.dart';
import '../prayer_demo/prayer_demo_section.dart';
import '../shell/site_footer.dart';
import '../shell/site_top_bar.dart';
import 'home_section.dart';
import 'widgets/download_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/features_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/icon_style_showcase.dart';
import 'widgets/languages_section.dart';
import 'widgets/screenshots_section.dart';
import 'widgets/theme_showcase.dart';

/// The single-page landing site. [section] comes from a deep link such as
/// `/faq` and is scrolled into view.
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.section});

  final HomeSection? section;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _anchors = {for (final s in HomeSection.values) s: GlobalKey()};
  HomeSection? _lastScrolled;

  @override
  void initState() {
    super.initState();
    final section = widget.section;
    if (section != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollTo(section, animate: false),
      );
    }
  }

  @override
  void didUpdateWidget(HomePage old) {
    super.didUpdateWidget(old);
    // Browser back/forward between section URLs.
    final section = widget.section;
    if (section != null && section != _lastScrolled) _scrollTo(section);
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _navigate(HomeSection section) {
    _scrollTo(section);
    context.go(section.path);
  }

  void _scrollTo(HomeSection section, {bool animate = true}) {
    _lastScrolled = section;
    final target = _anchors[section]!.currentContext?.findRenderObject();
    if (target == null || !_scroll.hasClients) return;
    final reveal = RenderAbstractViewport.of(
      target,
    ).getOffsetToReveal(target, 0);
    final position = _scroll.position;
    final offset = (reveal.offset - SiteTopBar.heightOf(context) - 12).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (!animate || MediaQuery.disableAnimationsOf(context)) {
      _scroll.jumpTo(offset);
    } else {
      _scroll.animateTo(
        offset,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final spacing = context.sectionSpacing;

    Widget section(HomeSection id, Widget child, {bool reveal = true}) =>
        KeyedSubtree(
          key: _anchors[id],
          child: Padding(
            padding: EdgeInsets.only(top: spacing),
            child: ContentWidth(
              child: reveal ? ScrollReveal(child: child) : child,
            ),
          ),
        );

    return Title(
      title: '${l10n.appName} · ${l10n.appTagline}',
      color: context.palette.heroFrom,
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(child: AmbientBackground()),
            Scrollbar(
              controller: _scroll,
              child: SingleChildScrollView(
                controller: _scroll,
                padding: EdgeInsets.only(
                  top: SiteTopBar.heightOf(context) + 24,
                ),
                child: Column(
                  children: [
                    HeroSection(
                      onTryDemo: () => _navigate(HomeSection.prayerTimes),
                    ),
                    section(
                      HomeSection.features,
                      const FeaturesSection(),
                      reveal: false,
                    ),
                    section(HomeSection.prayerTimes, const PrayerDemoSection()),
                    section(
                      HomeSection.themes,
                      const ThemeShowcase(),
                      reveal: false,
                    ),
                    section(
                      HomeSection.iconStyles,
                      const IconStyleShowcase(),
                      reveal: false,
                    ),
                    section(
                      HomeSection.languages,
                      const LanguagesSection(),
                      reveal: false,
                    ),
                    section(
                      HomeSection.screenshots,
                      const ScreenshotsSection(),
                    ),
                    section(HomeSection.faq, const FaqSection()),
                    section(HomeSection.download, const DownloadSection()),
                    SizedBox(height: spacing),
                    const SiteFooter(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SiteTopBar(onNavigate: _navigate),
            ),
          ],
        ),
      ),
    );
  }
}
