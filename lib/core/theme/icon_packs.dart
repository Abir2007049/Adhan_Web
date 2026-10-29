import 'palettes.dart';

/// The four 3D icon packs, stored under `assets/icons/<directory>/`.
enum IconPack {
  clay('clay'),
  goldEmerald('gold_emerald'),
  frostedGlass('frosted_glass'),
  nightGlow('night_glow');

  const IconPack(this.directory);

  final String directory;

  /// The pack "Match theme" picks for [palette].
  static IconPack forPalette(PaletteId palette) => switch (palette) {
    PaletteId.violet ||
    PaletteId.aurora ||
    PaletteId.deepPlum => IconPack.nightGlow,
    PaletteId.purple => IconPack.clay,
    PaletteId.emerald ||
    PaletteId.green ||
    PaletteId.roseGold ||
    PaletteId.diSerria => IconPack.goldEmerald,
    PaletteId.dusk ||
    PaletteId.rose ||
    PaletteId.pink ||
    PaletteId.pearl => IconPack.frostedGlass,
  };

  String assetFor(IconItem item) =>
      'assets/icons/$directory/${item.assetName}.webp';
}

/// The 12 icons every pack provides.
enum IconItem {
  quran('quran'),
  duas('duas'),
  qibla('qibla'),
  mosques('mosques'),
  prayerTimes('prayer_times'),
  themes('themes'),
  location('location'),
  settings('settings'),
  account('account'),
  weather('weather'),
  calendar('calendar'),
  zakat('zakat');

  const IconItem(this.assetName);

  final String assetName;
}

/// The visitor's icon choice: a fixed pack, or follow the palette.
enum IconStyle {
  matchTheme(null),
  clay(IconPack.clay),
  goldEmerald(IconPack.goldEmerald),
  frostedGlass(IconPack.frostedGlass),
  nightGlow(IconPack.nightGlow);

  const IconStyle(this.fixedPack);

  final IconPack? fixedPack;

  IconPack resolve(PaletteId palette) =>
      fixedPack ?? IconPack.forPalette(palette);

  static IconStyle fromName(String? name) => values.firstWhere(
    (s) => s.name == name,
    orElse: () => IconStyle.matchTheme,
  );
}
