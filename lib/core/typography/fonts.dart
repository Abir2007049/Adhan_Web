import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Font family names used across the site.
///
/// Only [inter] is declared in `pubspec.yaml` and ships with the first
/// download. Every other family is loaded on demand by [FontRegistry], which
/// keeps the initial bundle lean.
abstract final class FontFamilies {
  // UI chrome.
  static const inter = 'Inter';
  static const almarai = 'Almarai';
  static const notoSansArabic = 'NotoSansArabic';
  static const vazirmatn = 'Vazirmatn';
  static const notoSansBengali = 'NotoSansBengali';
  static const notoSansDevanagari = 'NotoSansDevanagari';

  // Content (Quran and Dua text only).
  static const amiriQuran = 'AmiriQuran';
  static const scheherazadeNew = 'ScheherazadeNew';
}

/// Loads deferred font families from `assets/fonts/` with [FontLoader].
///
/// Once a family finishes loading the engine relayouts text, so callers can
/// fire and forget.
abstract final class FontRegistry {
  static const _dir = 'assets/fonts';

  static const Map<String, List<String>> _files = {
    FontFamilies.almarai: [
      'almarai_regular',
      'almarai_bold',
      'almarai_extrabold',
    ],
    FontFamilies.notoSansArabic: [
      'noto_sans_arabic_regular',
      'noto_sans_arabic_semibold',
      'noto_sans_arabic_bold',
    ],
    FontFamilies.vazirmatn: ['vazirmatn_regular', 'vazirmatn_bold'],
    FontFamilies.notoSansBengali: [
      'noto_sans_bengali_regular',
      'noto_sans_bengali_bold',
    ],
    FontFamilies.notoSansDevanagari: [
      'noto_sans_devanagari_regular',
      'noto_sans_devanagari_bold',
    ],
    FontFamilies.amiriQuran: ['amiri_quran'],
    FontFamilies.scheherazadeNew: ['scheherazade_new'],
  };

  static final Map<String, Future<void>> _loads = {};

  /// Loads [family] once. Bundled families and unknown names complete
  /// immediately. Failures are logged and can be retried later.
  static Future<void> ensure(String family) {
    final files = _files[family];
    if (files == null) return Future.value();
    return _loads[family] ??= _load(family, files);
  }

  /// Loads every deferred family, for sections that show all scripts.
  static Future<void> ensureAll() => Future.wait(_files.keys.map(ensure));

  static Future<void> _load(String family, List<String> files) async {
    try {
      final loader = FontLoader(family);
      for (final file in files) {
        loader.addFont(rootBundle.load('$_dir/$file.ttf'));
      }
      await loader.load();
    } catch (error) {
      _loads.remove(family);
      debugPrint('Font "$family" failed to load: $error');
    }
  }
}
