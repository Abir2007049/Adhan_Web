# Muslim Soul website

The marketing site and web companion for **Muslim Soul**, the Android prayer-time
and Adhan app. It is built with Flutter Web (Material 3, Riverpod, go_router) and
shares the app's design language: 12 palettes in light and dark, four 3D icon packs,
and 12 languages with full right-to-left support.

## Quick start

Requires Flutter stable 3.41 or newer (Dart 3.11).

```sh
flutter pub get
flutter run -d chrome                 # develop
flutter test                          # unit + layout smoke tests
flutter analyze
flutter build web --release           # CanvasKit build in build/web
flutter build web --release --wasm    # WebAssembly build (falls back to JS where unsupported)
```

`flutter gen-l10n` runs automatically on `pub get`, `run` and `build`. Run it by
hand after editing ARB files if your IDE doesn't pick up the change.

### Deploying

The site uses clean path URLs (`/features`, `/privacy`, `/qibla`), so the host
must serve `index.html` for any unknown path (an "SPA fallback"). Examples:
Firebase `"rewrites": [{"source": "**", "destination": "/index.html"}]`, Netlify
`/* /index.html 200`, nginx `try_files $uri /index.html;`. If you serve from a
sub-path, build with `--base-href /sub/path/`.

## What's where

```
lib/
  main.dart                 Loads prefs and the visitor's script font, then runs the app
  app.dart                  MaterialApp.router: themes, locale, RTL, text-height rule
  core/
    l10n/                   ARB files, generated AppLocalizations, AppLanguage, controller
    router/                 go_router config
    theme/                  AppPalette tokens, the 12 palettes, ThemeData, icon packs
    typography/             UI and content type systems, lazy FontRegistry
    utils/                  numerals, AM/PM, contrast, layout breakpoints, clock, links
    widgets/                GlassCard, HeroCard, PillButton, IconTile, SectionHeader,
                            ScrollReveal, Pressable (hover/press/focus), GeoIcon glyphs
  features/
    home/                   Landing page and its sections
    prayer_demo/            Live prayer times (Aladhan API) and the Makkah schedule
    qibla/                  /qibla bearing calculator
    privacy/, terms/        Legal pages (placeholder copy)
    shell/                  Top bar, footer, sub-page layout
    not_found/              404
test/                       Contrast, icon mapping, numerals/AM-PM, ARB completeness,
                            prayer/Qibla maths, and a layout smoke test
web/                        index.html (SEO/Open Graph), manifest, icons, splash
```

### Routes

| Path | Shows |
| --- | --- |
| `/` | Landing page |
| `/features`, `/prayer-times`, `/themes`, `/icon-styles`, `/languages`, `/screenshots`, `/faq`, `/download` | Landing page, scrolled to that section (shareable deep links) |
| `/privacy`, `/terms` | Legal pages |
| `/qibla` | Qibla calculator |
| anything else | 404 page |

All home URLs share one page key, so the nav bar updates the URL and scrolls in
place, and browser back and forward move between sections.

## Defaults I chose

- **Latin UI font: Inter**, bundled (weights 400/600/700). It covers Cyrillic for Russian.
- **Only Inter ships up front.** Every other font loads on demand through
  `FontRegistry` (`lib/core/typography/fonts.dart`). The visitor's own script loads
  before the first frame. The rest load in the background after first paint, for the
  language picker, the Arabic prayer names and the Quran and dua samples.
- **Urdu UI uses Noto Sans Arabic**, not Nastaliq. Nastaliq's very tall metrics
  don't fit fixed-height UI rows. Persian uses Vazirmatn. Arabic uses Almarai.
- **Bengali uses static Noto Sans Bengali** (Regular and Bold) downloaded from
  Google Fonts. The `noto_sans_bengali.ttf` in the asset pack is a variable font,
  the same problem the brief raises about Cairo.
- **Hindi uses Noto Sans Devanagari**, downloaded from Google Fonts, since the pack
  had no Devanagari font.
- **Content fonts:** the ayah sample uses Amiri Quran and the dua sample uses
  Scheherazade New. Not bundled: Kalpurush, KFGQPC Hafs, Noorehuda, Noto Naskh
  Arabic and Noto Nastaliq Urdu. They stay in the asset pack if you need them.
- **Hero phone mockup shows Makkah.** Times are calculated on-device with the
  `adhan` package (Umm al-Qura method). Makkah stays on UTC+3 year round, so the
  card is correct in any visitor time zone, and the countdown ticks every second.
- **Live demo uses the Aladhan API.** It returns the location's local times and
  time zone (so city picks need no time-zone database) and picks the nearest
  calculation authority. Coordinates are rounded to 4 decimals. The privacy
  placeholder says so.
- **Somali** has no Flutter framework localizations, so framework strings
  (tooltips and the like) fall back to English
  (`lib/core/l10n/fallback_localizations.dart`). All site copy is still Somali.
- **Reduced motion:** `MediaQuery.disableAnimations` (the browser's
  `prefers-reduced-motion`) turns off scroll reveals, hover lift, carousel and
  scroll animations, the theme cross-fade and the splash pulse.
- **`<html lang dir>`** follows the site language, for screen readers and SEO.

## Theming

Each palette is an `AppPalette` `ThemeExtension` with the brief's 19 tokens. Read
it with `context.palette`. `AppPalette.derive` fills in the derived tokens:
`onHero` / `onHeroMuted` (white, or `fg` for light heroes), `accentSoft` 14%,
`accentBg` 18%, `accentBorder` 45%, `borderStrong` ≈ 2.3× border alpha, and
`divider` ≈ 0.5× border alpha. Glass palettes (translucent `bgElev*`) get a
backdrop blur on cards. Opaque ones draw flat.

### Add a palette

1. Add a value to `PaletteId` in `lib/core/theme/palettes.dart`, with the app's
   enum name as `storageKey`.
2. Add a dark and a light `AppPalette.derive(...)` to the `_dark` and `_light` maps.
   Pass `lightHero: true` if the hero gradient is light.
3. Map it to an icon pack in `IconPack.forPalette` (`lib/core/theme/icon_packs.dart`).
4. Add a `palette<Name>` string to every ARB file and to `paletteName()` in
   `lib/features/home/widgets/theme_showcase.dart`.
5. Run `flutter test`. `palette_contrast_test.dart` checks the new palette against
   WCAG AA, and the mapping test fails until step 3 is done.

### Contrast adjustments

The brief asks for WCAG AA: 4.5:1 for `fg`/`fgMuted` on `bg` and every elevated
surface, and for `onHero` on both hero gradient stops. These tokens failed with the
supplied values and were nudged. Only lightness changed (hue kept), and only as far
as needed to pass. Each is marked `// AA: was …` in `palettes.dart`.

| Palette | Mode | Token | Was | Now | Ratio |
| --- | --- | --- | --- | --- | --- |
| GREEN | dark + light | `heroFrom` | `0xFF22C55E` | `0xFF178841` | white 2.28 → 4.53 |
| ROSE | dark | `heroFrom` | `0xFFFF6FB5` | `0xFFE70070` | white 2.56 → 4.53 |
| PINK | dark + light | `heroFrom` | `0xFFEC4899` | `0xFFE2177B` | white 3.53 → 4.52 |
| PURPLE | dark + light | `heroFrom` | `0xFFA855F7` | `0xFF9F44F6` | white 3.96 → 4.53 |
| PEARL | dark | `onHero` | `fg` (`0xFFFFF4EE`) | `0xFF2A1014` | 1.00 → 8.50 (light hero needs dark text) |
| GREEN | light | `fgMuted` | `0xFF3A6B4E` | `0xFF39694D` | on `bgElev3` 4.41 → 4.53 |
| PINK | light | `fgMuted` | `0xFF8A3A5E` | `0xFF893A5D` | on `bgElev3` 4.48 → 4.51 |

`onHeroMuted` (white at 72%) can't reach 4.5:1 on most heroes without becoming
`onHero`. So it is held to the **3:1 large-text** threshold and used only for large
text (the 22 px Arabic prayer name on the Salah card). All small text on a hero uses
`onHero`. Four palettes needed a higher alpha to reach 3:1:

| Palette | Mode | `onHeroMuted` | Ratio |
| --- | --- | --- | --- |
| ROSE | dark | `0xC5FFFFFF` (77%) | 2.76 → 3.04 |
| PINK | dark + light | `0xC0FFFFFF` (75%) | 2.87 → 3.04 |
| DUSK | light | `0xBBFFFFFF` (73%) | 2.99 → 3.05 |

`fgFaint` is decorative (dividers, inactive markers) and is not used for readable text.

## Icons

Four 3D packs live in `assets/icons/<pack>/<item>.webp`: `clay`, `gold_emerald`,
`frosted_glass` and `night_glow`, each with the 12 items `quran, duas, qibla,
mosques, prayer_times, themes, location, settings, account, weather, calendar,
zakat`. They are drawn with `IconTile`, which never tints them and cross-fades
when the pack changes.

"Match theme" picks the pack from the palette (`IconPack.forPalette`):
VIOLET, AURORA, DEEP_PLUM → Night Glow · PURPLE → Glossy Clay · EMERALD, GREEN,
ROSE_GOLD, DI_SERRIA → Gold Emerald · DUSK, ROSE, PINK, PEARL → Frosted Glass.

### Add or replace icon assets

Drop a WebP at `assets/icons/<pack>/<item>.webp`, roughly 256×256 with a
transparent or self-contained background. A missing file renders a colored
placeholder tile (see the `TODO(assets)` in `lib/core/widgets/icon_tile.dart`), so
nothing breaks while art is in progress. `icon_pack_mapping_test.dart` lists any
missing files. To add a **new pack**, add a value to `IconPack` (and to
`IconStyle`), list its folder under `assets:` in `pubspec.yaml`, and add a name
string to every ARB file.

UI glyphs (menu, chevrons, language, theme mode and so on) are not images. They are
painted by `GeoIcon` in the geometric arch-and-diamond style, and directional ones
mirror in RTL.

## Typography

There are two systems, never mixed:

- **UI chrome**: `AppTypography.uiFamily(language)` gives Inter, Almarai (ar), Noto
  Sans Arabic (ur), Vazirmatn (fa), Noto Sans Bengali (bn) or Noto Sans Devanagari
  (hi), with the others as fallbacks.
- **Content**: `AppTypography.quran()` (Amiri Quran) and `AppTypography.dua()`
  (Scheherazade New), only for scripture and supplication text.

Every text style has a fixed `height` with even leading, and the app applies
`TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent:
false)`. Sizes and spacing are identical in every language, with no per-language
bumps.

### Add a font

1. Put **static** TTF files (not variable fonts) in `assets/fonts/`.
2. Add a family name to `FontFamilies` and its files to `FontRegistry._files` in
   `lib/core/typography/fonts.dart`. Weights come from the files themselves.
3. Use the family in `AppTypography` (for example, return it from `uiFamily`).

Only fonts needed for the very first frame belong under `fonts:` in
`pubspec.yaml`. Today that is just Inter. Everything else stays lazy.

## Localization

- ARB files live in `lib/core/l10n/arb/`. `app_en.arb` is the English-only source
  of truth. Placeholders are described there.
- `arb_completeness_test.dart` fails if any language is missing a key, has an extra
  key, has an empty string, or changes a placeholder.
- Digits are localized with `localizeDigits()`: Arabic-Indic for ar and ur, Persian
  for fa, Bengali, Devanagari for hi, and Latin otherwise. Times use
  `formatClockTime()` / `localizedMeridiem()`, never locale AM/PM formatting.
  Digits written inside ARB strings (such as "1:1") are already in the native
  numerals.
- RTL (ar, ur, fa) comes from the language. Directional glyphs and the screenshot
  carousel mirror automatically.
- The language defaults to the browser's preferred language and is saved once
  chosen.

**Every non-English ARB file is machine-translated.** Each one carries
`"@@x-review": "TODO review: …"` at the top. Somali is the lowest-confidence
translation.

### Add a language

1. Add a value to `AppLanguage` (`lib/core/l10n/app_language.dart`) with its native
   name. Update `isRtl` if it is right-to-left.
2. Copy `app_en.arb` to `app_<code>.arb`, set `@@locale`, and translate.
3. Add its numerals to `numerals.dart`, its AM/PM markers to `time_format.dart`,
   and its UI font to `AppTypography.uiFamily` (plus `FontRegistry` if the font is
   new).
4. If Flutter has no framework localizations for it (as with Somali), nothing else
   is needed. The fallback delegates cover it.
5. Run `flutter test`. The ARB, numeral and layout smoke tests cover every
   `AppLanguage` automatically.

## Accessibility

- Every interactive surface goes through `Pressable`, which provides button
  semantics, selected state, Enter/Space activation, a pointer cursor and a 2 px
  focus ring that clears 3:1 against `bg`.
- Images carry semantic labels, or are excluded when they are decorative.
- Live regions announce demo results and errors.
- `test/layout_smoke_test.dart` renders every page at 360, 800 and 1440 px in all
  12 languages and fails on any overflow.
#   A d h a n _ W e b  
 