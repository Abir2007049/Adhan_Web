import '../l10n/app_language.dart';
import 'numerals.dart';

/// The AM/PM marker for [language].
///
/// Hand-written instead of locale formatting, which gives inconsistent
/// markers (or none) across the 12 supported languages.
String localizedMeridiem(AppLanguage language, bool isPm) {
  final (am, pm) = switch (language) {
    AppLanguage.bn => ('পূর্বাহ্ণ', 'অপরাহ্ণ'),
    AppLanguage.ar => ('ص', 'م'),
    AppLanguage.ur => ('صبح', 'شام'),
    AppLanguage.hi => ('पूर्वाह्न', 'अपराह्न'),
    AppLanguage.ms => ('PG', 'PTG'),
    AppLanguage.tr => ('ÖÖ', 'ÖS'),
    AppLanguage.fa => ('ق.ظ', 'ب.ظ'),
    AppLanguage.so => ('GH', 'GD'),
    AppLanguage.en ||
    AppLanguage.id ||
    AppLanguage.fr ||
    AppLanguage.ru => ('AM', 'PM'),
  };
  return isPm ? pm : am;
}

/// Formats a wall-clock time as `h:mm` plus the localized meridiem, with
/// native digits, for example "4:50 AM" or "٤:٥٠ ص".
String formatClockTime(int hour24, int minute, AppLanguage language) {
  final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
  final mm = minute.toString().padLeft(2, '0');
  final meridiem = localizedMeridiem(language, hour24 >= 12);
  return localizeDigits('$hour12:$mm $meridiem', language);
}

/// Formats [duration] as `HH:MM:SS` with native digits. Negative durations
/// clamp to zero.
String formatCountdown(Duration duration, AppLanguage language) {
  final seconds = duration.isNegative ? 0 : duration.inSeconds;
  String two(int n) => n.toString().padLeft(2, '0');
  final text =
      '${two(seconds ~/ 3600)}:${two(seconds ~/ 60 % 60)}:${two(seconds % 60)}';
  return localizeDigits(text, language);
}
