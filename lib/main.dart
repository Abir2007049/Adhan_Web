import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/l10n/language_controller.dart';
import 'core/typography/app_typography.dart';
import 'core/typography/fonts.dart';
import 'core/utils/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
  );

  // Load the visitor's own script before the first frame so text doesn't
  // flash in a fallback font. Other scripts follow once the page is up.
  await FontRegistry.ensure(
    AppTypography.uiFamily(container.read(languageProvider)),
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MuslimSoulApp(),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) => FontRegistry.ensureAll());
}
