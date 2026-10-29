import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/home/home_section.dart';
import '../../features/not_found/not_found_page.dart';
import '../../features/privacy/privacy_page.dart';
import '../../features/qibla/qibla_page.dart';
import '../../features/terms/terms_page.dart';

/// Routes: `/`, one deep link per [HomeSection] (`/features`, `/faq`, ...),
/// `/privacy`, `/terms` and `/qibla`.
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(path: '/', pageBuilder: (context, state) => _home(null)),
      GoRoute(
        path: '/privacy',
        pageBuilder: (context, state) => _page(state, const PrivacyPage()),
      ),
      GoRoute(
        path: '/terms',
        pageBuilder: (context, state) => _page(state, const TermsPage()),
      ),
      GoRoute(
        path: '/qibla',
        pageBuilder: (context, state) => _page(state, const QiblaPage()),
      ),
      GoRoute(
        path: '/:section',
        pageBuilder: (context, state) {
          final section = HomeSection.fromSlug(state.pathParameters['section']);
          return section == null
              ? _page(state, const NotFoundPage())
              : _home(section);
        },
      ),
    ],
    errorPageBuilder: (context, state) => _page(state, const NotFoundPage()),
  ),
);

/// Every home URL shares one page key, so moving between `/` and section
/// links updates the page in place (and scrolls) instead of pushing a new
/// one.
Page<void> _home(HomeSection? section) => NoTransitionPage(
  key: const ValueKey('home'),
  child: HomePage(section: section),
);

Page<void> _page(GoRouterState state, Widget child) =>
    NoTransitionPage(key: state.pageKey, child: child);
