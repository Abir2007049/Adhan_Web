import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/core/theme/icon_packs.dart';
import 'package:muslim_soul_web/core/theme/palettes.dart';

void main() {
  test('"Match theme" maps every palette to the brief\'s pack', () {
    const expected = {
      PaletteId.violet: IconPack.nightGlow,
      PaletteId.aurora: IconPack.nightGlow,
      PaletteId.deepPlum: IconPack.nightGlow,
      PaletteId.purple: IconPack.clay,
      PaletteId.emerald: IconPack.goldEmerald,
      PaletteId.green: IconPack.goldEmerald,
      PaletteId.roseGold: IconPack.goldEmerald,
      PaletteId.diSerria: IconPack.goldEmerald,
      PaletteId.dusk: IconPack.frostedGlass,
      PaletteId.rose: IconPack.frostedGlass,
      PaletteId.pink: IconPack.frostedGlass,
      PaletteId.pearl: IconPack.frostedGlass,
    };
    expect(expected.keys, unorderedEquals(PaletteId.values));
    for (final MapEntry(key: palette, value: pack) in expected.entries) {
      expect(IconPack.forPalette(palette), pack, reason: palette.storageKey);
      expect(IconStyle.matchTheme.resolve(palette), pack);
    }
  });

  test('a fixed icon style ignores the palette', () {
    for (final style in IconStyle.values.where((s) => s.fixedPack != null)) {
      for (final palette in PaletteId.values) {
        expect(style.resolve(palette), style.fixedPack);
      }
    }
  });

  test('asset paths use the pack directory and snake_case item name', () {
    expect(
      IconPack.goldEmerald.assetFor(IconItem.prayerTimes),
      'assets/icons/gold_emerald/prayer_times.webp',
    );
  });

  test('all 48 icon assets exist', () {
    final missing = [
      for (final pack in IconPack.values)
        for (final item in IconItem.values)
          if (!File(pack.assetFor(item)).existsSync()) pack.assetFor(item),
    ];
    expect(missing, isEmpty);
  });

  test('unknown stored values fall back to the defaults', () {
    expect(IconStyle.fromName('nope'), IconStyle.matchTheme);
    expect(PaletteId.fromStorageKey(null), PaletteId.violet);
    expect(PaletteId.fromStorageKey('ROSE_GOLD'), PaletteId.roseGold);
  });
}
