import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/theme/theme_controller.dart';
import '../../core/widgets/geo_icon.dart';
import '../../core/widgets/pill_button.dart';

GeoGlyph themeModeGlyph(ThemeMode mode) => switch (mode) {
  ThemeMode.system => GeoGlyph.system,
  ThemeMode.light => GeoGlyph.sun,
  ThemeMode.dark => GeoGlyph.moon,
};

String themeModeLabel(ThemeMode mode, AppLocalizations l10n) => switch (mode) {
  ThemeMode.system => l10n.themeModeSystem,
  ThemeMode.light => l10n.themeModeLight,
  ThemeMode.dark => l10n.themeModeDark,
};

/// System / Light / Dark as a row of pills; the current mode is filled.
class ThemeModePills extends ConsumerWidget {
  const ThemeModePills({super.key, this.alignment = WrapAlignment.start});

  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(themeModeProvider);
    return Wrap(
      alignment: alignment,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final mode in ThemeMode.values)
          Semantics(
            selected: mode == current,
            child: PillButton(
              label: themeModeLabel(mode, l10n),
              glyph: themeModeGlyph(mode),
              dense: true,
              variant: mode == current
                  ? PillVariant.primary
                  : PillVariant.secondary,
              onPressed: () =>
                  ref.read(themeModeProvider.notifier).select(mode),
            ),
          ),
      ],
    );
  }
}
