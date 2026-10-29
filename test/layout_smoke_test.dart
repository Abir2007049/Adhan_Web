import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/app.dart';
import 'package:muslim_soul_web/core/l10n/app_language.dart';
import 'package:muslim_soul_web/core/router/app_router.dart';
import 'package:muslim_soul_web/core/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Renders every page at the three breakpoints in all 12 languages and fails
/// on any layout overflow or build error.
void main() {
  const widths = {'mobile': 360.0, 'tablet': 800.0, 'desktop': 1440.0};
  const routes = ['/', '/privacy', '/terms', '/qibla', '/does-not-exist'];

  for (final language in AppLanguage.values) {
    for (final MapEntry(key: name, value: width) in widths.entries) {
      testWidgets('renders all pages: ${language.code}, $name', (tester) async {
        tester.view
          ..physicalSize = Size(width, 900)
          ..devicePixelRatio = 1;
        addTearDown(tester.view.reset);

        SharedPreferences.setMockInitialValues({'language': language.code});
        final container = ProviderContainer(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(
              await SharedPreferences.getInstance(),
            ),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MuslimSoulApp(),
          ),
        );
        await tester.pump(const Duration(seconds: 1));

        final router = container.read(routerProvider);
        for (final route in routes) {
          router.go(route);
          await tester.pump(const Duration(seconds: 1));
          // Scroll the whole page so every section lays out and reveals.
          final scrollable = find.byType(Scrollable).first;
          for (var i = 0; i < 30; i++) {
            await tester.drag(scrollable, const Offset(0, -600));
            await tester.pump(const Duration(milliseconds: 700));
          }
          expect(tester.takeException(), isNull, reason: route);
        }

        // Unmount so the per-second clock timer is cancelled.
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
