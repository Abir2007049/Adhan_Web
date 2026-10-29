import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/preferences.dart';
import 'icon_packs.dart';
import 'palettes.dart';

final paletteProvider = NotifierProvider<PaletteController, PaletteId>(
  PaletteController.new,
);

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

final iconStyleProvider = NotifierProvider<IconStyleController, IconStyle>(
  IconStyleController.new,
);

/// The icon pack currently on screen, after resolving "Match theme".
final activeIconPackProvider = Provider<IconPack>(
  (ref) => ref.watch(iconStyleProvider).resolve(ref.watch(paletteProvider)),
);

class PaletteController extends Notifier<PaletteId> {
  static const _key = 'palette';

  @override
  PaletteId build() => PaletteId.fromStorageKey(
    ref.watch(sharedPreferencesProvider).getString(_key),
  );

  void select(PaletteId palette) {
    state = palette;
    ref.read(sharedPreferencesProvider).setString(_key, palette.storageKey);
  }
}

class ThemeModeController extends Notifier<ThemeMode> {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    final saved = ref.watch(sharedPreferencesProvider).getString(_key);
    return ThemeMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => ThemeMode.system,
    );
  }

  void select(ThemeMode mode) {
    state = mode;
    ref.read(sharedPreferencesProvider).setString(_key, mode.name);
  }
}

class IconStyleController extends Notifier<IconStyle> {
  static const _key = 'icon_style';

  @override
  IconStyle build() =>
      IconStyle.fromName(ref.watch(sharedPreferencesProvider).getString(_key));

  void select(IconStyle style) {
    state = style;
    ref.read(sharedPreferencesProvider).setString(_key, style.name);
  }
}
