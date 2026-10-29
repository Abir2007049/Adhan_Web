import 'dart:ui';

/// The 12 languages the app and the site support.
enum AppLanguage {
  en('English'),
  bn('বাংলা'),
  ar('العربية'),
  ur('اردو'),
  hi('हिन्दी'),
  id('Bahasa Indonesia'),
  ms('Bahasa Melayu'),
  tr('Türkçe'),
  fa('فارسی'),
  so('Soomaali'),
  fr('Français'),
  ru('Русский');

  const AppLanguage(this.nativeName);

  /// The language's name written in its own script.
  final String nativeName;

  String get code => name;

  Locale get locale => Locale(code);

  bool get isRtl => this == ar || this == ur || this == fa;

  TextDirection get textDirection =>
      isRtl ? TextDirection.rtl : TextDirection.ltr;

  static AppLanguage? fromCode(String? code) {
    for (final language in values) {
      if (language.code == code) return language;
    }
    return null;
  }

  /// The first of [locales] (browser preference order) that we support,
  /// falling back to English.
  static AppLanguage fromLocales(Iterable<Locale> locales) {
    for (final locale in locales) {
      final match = fromCode(locale.languageCode);
      if (match != null) return match;
    }
    return en;
  }
}
