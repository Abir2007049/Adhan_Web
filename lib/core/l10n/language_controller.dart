import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../typography/app_typography.dart';
import '../typography/fonts.dart';
import '../utils/preferences.dart';
import 'app_language.dart';
import 'document_language.dart';

/// The site language: the saved choice, else the browser's language.
final languageProvider = NotifierProvider<LanguageController, AppLanguage>(
  LanguageController.new,
);

class LanguageController extends Notifier<AppLanguage> {
  static const _key = 'language';

  @override
  AppLanguage build() {
    final saved = ref.watch(sharedPreferencesProvider).getString(_key);
    final language =
        AppLanguage.fromCode(saved) ??
        AppLanguage.fromLocales(PlatformDispatcher.instance.locales);
    syncDocumentLanguage(language);
    return language;
  }

  void select(AppLanguage language) {
    FontRegistry.ensure(AppTypography.uiFamily(language));
    syncDocumentLanguage(language);
    state = language;
    ref.read(sharedPreferencesProvider).setString(_key, language.code);
  }
}
