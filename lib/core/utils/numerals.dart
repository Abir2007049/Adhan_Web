import '../l10n/app_language.dart';

/// Code unit of the digit zero in [language]'s numbering system.
int _zeroFor(AppLanguage language) => switch (language) {
  AppLanguage.ar || AppLanguage.ur => 0x0660, // Arabic-Indic ٠
  AppLanguage.fa => 0x06F0, // Extended Arabic-Indic (Persian) ۰
  AppLanguage.bn => 0x09E6, // Bengali ০
  AppLanguage.hi => 0x0966, // Devanagari ०
  _ => 0x0030, // Latin 0
};

/// Replaces ASCII digits in [input] with [language]'s native digits.
/// Everything else is left untouched.
String localizeDigits(String input, AppLanguage language) {
  final zero = _zeroFor(language);
  if (zero == 0x0030) return input;
  final out = StringBuffer();
  for (final unit in input.codeUnits) {
    out.writeCharCode(unit >= 0x30 && unit <= 0x39 ? zero + unit - 0x30 : unit);
  }
  return out.toString();
}

/// Converts any supported native digits in [input] back to ASCII, so typed
/// numbers can be parsed whatever keyboard the visitor uses.
String asciiDigits(String input) {
  const zeros = [0x0660, 0x06F0, 0x09E6, 0x0966];
  final out = StringBuffer();
  for (final unit in input.codeUnits) {
    final zero = zeros.where((z) => unit >= z && unit <= z + 9).firstOrNull;
    out.writeCharCode(zero == null ? unit : 0x30 + unit - zero);
  }
  return out.toString();
}
