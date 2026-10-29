import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/core/l10n/app_language.dart';

/// Every key in app_en.arb (the source of truth) must exist in all 12 ARB
/// files, with the same placeholders, and no file may carry stray keys.
void main() {
  const dir = 'lib/core/l10n/arb';

  Map<String, String> messages(String code) {
    final json =
        jsonDecode(File('$dir/app_$code.arb').readAsStringSync())
            as Map<String, dynamic>;
    return {
      for (final MapEntry(:key, :value) in json.entries)
        if (!key.startsWith('@')) key: value as String,
    };
  }

  Set<String> placeholders(String message) =>
      RegExp(r'\{(\w+)\}').allMatches(message).map((m) => m[1]!).toSet();

  final english = messages('en');

  test('there is exactly one ARB file per supported language', () {
    final codes = Directory(dir)
        .listSync()
        .map((f) => RegExp(r'app_(\w+)\.arb$').firstMatch(f.path)?[1])
        .nonNulls
        .toSet();
    expect(codes, AppLanguage.values.map((l) => l.code).toSet());
  });

  for (final language in AppLanguage.values) {
    test('${language.code} has every key, placeholder and a value', () {
      final translated = messages(language.code);
      final missing = english.keys.toSet().difference(translated.keys.toSet());
      final extra = translated.keys.toSet().difference(english.keys.toSet());
      expect(missing, isEmpty, reason: 'missing in app_${language.code}.arb');
      expect(extra, isEmpty, reason: 'not in app_en.arb');
      for (final MapEntry(:key, :value) in english.entries) {
        final message = translated[key]!;
        expect(message.trim(), isNotEmpty, reason: '${language.code}.$key');
        expect(
          placeholders(message),
          placeholders(value),
          reason: '${language.code}.$key placeholders',
        );
      }
    });
  }
}
