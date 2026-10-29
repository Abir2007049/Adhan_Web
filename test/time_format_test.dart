import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/core/l10n/app_language.dart';
import 'package:muslim_soul_web/core/utils/numerals.dart';
import 'package:muslim_soul_web/core/utils/time_format.dart';

void main() {
  group('localizedMeridiem', () {
    test('has distinct, non-empty AM and PM markers for every language', () {
      for (final language in AppLanguage.values) {
        final am = localizedMeridiem(language, false);
        final pm = localizedMeridiem(language, true);
        expect(am, isNotEmpty, reason: language.code);
        expect(pm, isNotEmpty, reason: language.code);
        expect(am, isNot(pm), reason: language.code);
      }
    });

    test('uses the expected markers', () {
      expect(localizedMeridiem(AppLanguage.en, false), 'AM');
      expect(localizedMeridiem(AppLanguage.en, true), 'PM');
      expect(localizedMeridiem(AppLanguage.ar, false), 'ص');
      expect(localizedMeridiem(AppLanguage.ar, true), 'م');
      expect(localizedMeridiem(AppLanguage.fa, true), 'ب.ظ');
      expect(localizedMeridiem(AppLanguage.tr, true), 'ÖS');
    });
  });

  group('localizeDigits', () {
    test('maps ASCII digits to each numbering system', () {
      const input = '0123456789';
      expect(localizeDigits(input, AppLanguage.en), input);
      expect(localizeDigits(input, AppLanguage.ar), '٠١٢٣٤٥٦٧٨٩');
      expect(localizeDigits(input, AppLanguage.ur), '٠١٢٣٤٥٦٧٨٩');
      expect(localizeDigits(input, AppLanguage.fa), '۰۱۲۳۴۵۶۷۸۹');
      expect(localizeDigits(input, AppLanguage.bn), '০১২৩৪৫৬৭৮৯');
      expect(localizeDigits(input, AppLanguage.hi), '०१२३४५६७८९');
      for (final latin in [
        AppLanguage.id,
        AppLanguage.ms,
        AppLanguage.tr,
        AppLanguage.so,
        AppLanguage.fr,
        AppLanguage.ru,
      ]) {
        expect(localizeDigits(input, latin), input, reason: latin.code);
      }
    });

    test('leaves non-digits untouched', () {
      expect(
        localizeDigits('Fajr 4:50 – ok', AppLanguage.ar),
        'Fajr ٤:٥٠ – ok',
      );
    });

    test('asciiDigits reverses every numbering system', () {
      for (final language in AppLanguage.values) {
        expect(asciiDigits(localizeDigits('-21.42', language)), '-21.42');
      }
    });
  });

  group('formatClockTime', () {
    test('uses a 12-hour clock with the localized meridiem', () {
      expect(formatClockTime(4, 50, AppLanguage.en), '4:50 AM');
      expect(formatClockTime(16, 5, AppLanguage.en), '4:05 PM');
      expect(formatClockTime(0, 0, AppLanguage.en), '12:00 AM');
      expect(formatClockTime(12, 0, AppLanguage.en), '12:00 PM');
    });

    test('localizes digits and meridiem together', () {
      expect(formatClockTime(16, 5, AppLanguage.ar), '٤:٠٥ م');
      expect(formatClockTime(4, 50, AppLanguage.fa), '۴:۵۰ ق.ظ');
      expect(formatClockTime(18, 41, AppLanguage.bn), '৬:৪১ অপরাহ্ণ');
    });
  });

  test('formatCountdown pads HH:MM:SS and clamps negatives', () {
    expect(
      formatCountdown(
        const Duration(hours: 4, minutes: 20, seconds: 7),
        AppLanguage.en,
      ),
      '04:20:07',
    );
    expect(
      formatCountdown(const Duration(seconds: -5), AppLanguage.en),
      '00:00:00',
    );
    expect(
      formatCountdown(const Duration(minutes: 1), AppLanguage.hi),
      '००:०१:००',
    );
  });
}
