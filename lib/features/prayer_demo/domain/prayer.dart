import '../../../core/l10n/generated/app_localizations.dart';

/// The five daily prayers, plus sunrise, which ends Fajr's window.
enum Prayer {
  fajr('الفجر'),
  sunrise('الشروق'),
  dhuhr('الظهر'),
  asr('العصر'),
  maghrib('المغرب'),
  isha('العشاء');

  const Prayer(this.arabicName);

  final String arabicName;

  /// Sunrise is listed but has no Adhan and is never the "next prayer".
  bool get isSalah => this != sunrise;

  String label(AppLocalizations l10n) => switch (this) {
    fajr => l10n.prayerFajr,
    sunrise => l10n.prayerSunrise,
    dhuhr => l10n.prayerDhuhr,
    asr => l10n.prayerAsr,
    maghrib => l10n.prayerMaghrib,
    isha => l10n.prayerIsha,
  };
}

/// A wall-clock time of day.
typedef ClockTime = ({int hour, int minute});
