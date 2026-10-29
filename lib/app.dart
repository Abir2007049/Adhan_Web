import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/l10n/fallback_localizations.dart';
import 'core/l10n/generated/app_localizations.dart';
import 'core/l10n/language_controller.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/typography/app_typography.dart';

class MuslimSoulApp extends ConsumerWidget {
  const MuslimSoulApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final language = ref.watch(languageProvider);
    final reduceMotion =
        PlatformDispatcher.instance.accessibilityFeatures.disableAnimations;

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(palette, Brightness.light, language),
      darkTheme: AppTheme.build(palette, Brightness.dark, language),
      themeMode: ref.watch(themeModeProvider),
      themeAnimationDuration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 300),
      locale: language.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ...fallbackLocalizationsDelegates,
      ],
      routerConfig: ref.watch(routerProvider),
      builder: (context, child) => Directionality(
        textDirection: language.textDirection,
        child: DefaultTextHeightBehavior(
          textHeightBehavior: AppTypography.textHeightBehavior,
          child: BackdropGroup(child: child!),
        ),
      ),
    );
  }
}
