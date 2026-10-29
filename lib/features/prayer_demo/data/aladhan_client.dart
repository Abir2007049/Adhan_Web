import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../domain/prayer.dart';

/// One day of prayer times in the location's own time zone.
class PrayerDay {
  const PrayerDay({
    required this.times,
    required this.date,
    required this.hijriDay,
    required this.hijriYear,
    required this.hijriMonthEn,
    required this.hijriMonthAr,
    required this.timezone,
    required this.method,
  });

  /// Parses the `data` object of an Aladhan `/v1/timings` response.
  factory PrayerDay.fromAladhan(Map<String, dynamic> data) {
    final timings = data['timings'] as Map<String, dynamic>;
    final date = data['date'] as Map<String, dynamic>;
    final gregorian = date['gregorian'] as Map<String, dynamic>;
    final hijri = date['hijri'] as Map<String, dynamic>;
    final hijriMonth = hijri['month'] as Map<String, dynamic>;
    final meta = data['meta'] as Map<String, dynamic>;

    // Times look like "04:50", sometimes with a suffix such as " (+06)".
    ClockTime clock(String key) {
      final parts = (timings[key] as String).substring(0, 5).split(':');
      return (hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }

    return PrayerDay(
      times: {
        Prayer.fajr: clock('Fajr'),
        Prayer.sunrise: clock('Sunrise'),
        Prayer.dhuhr: clock('Dhuhr'),
        Prayer.asr: clock('Asr'),
        Prayer.maghrib: clock('Maghrib'),
        Prayer.isha: clock('Isha'),
      },
      date: DateTime(
        int.parse(gregorian['year'] as String),
        (gregorian['month'] as Map<String, dynamic>)['number'] as int,
        int.parse(gregorian['day'] as String),
      ),
      hijriDay: int.parse(hijri['day'] as String),
      hijriYear: int.parse(hijri['year'] as String),
      hijriMonthEn: hijriMonth['en'] as String,
      hijriMonthAr: hijriMonth['ar'] as String,
      timezone: meta['timezone'] as String,
      method: (meta['method'] as Map<String, dynamic>)['name'] as String,
    );
  }

  final Map<Prayer, ClockTime> times;
  final DateTime date;
  final int hijriDay;
  final int hijriYear;
  final String hijriMonthEn;
  final String hijriMonthAr;
  final String timezone;
  final String method;
}

/// The Aladhan service failed or returned something unusable.
class PrayerServiceException implements Exception {
  const PrayerServiceException(this.cause);

  final Object cause;

  @override
  String toString() => 'PrayerServiceException: $cause';
}

final aladhanClientProvider = Provider<AladhanClient>((ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return AladhanClient(client);
});

/// Client for https://aladhan.com/prayer-times-api.
///
/// No method is passed, so Aladhan picks the authority nearest the
/// coordinates and reports it in the response.
class AladhanClient {
  const AladhanClient(this._http);

  final http.Client _http;

  /// Today's times at the coordinates. Passing "now" as a Unix timestamp
  /// makes Aladhan resolve "today" in the location's time zone, not ours.
  Future<PrayerDay> today(double latitude, double longitude) async {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final uri = Uri.https('api.aladhan.com', '/v1/timings/$now', {
      'latitude': latitude.toStringAsFixed(4),
      'longitude': longitude.toStringAsFixed(4),
    });
    try {
      final response = await _http
          .get(uri)
          .timeout(const Duration(seconds: 15));
      if (response.statusCode != 200) {
        throw PrayerServiceException('HTTP ${response.statusCode}');
      }
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return PrayerDay.fromAladhan(body['data'] as Map<String, dynamic>);
    } on PrayerServiceException {
      rethrow;
    } catch (error) {
      throw PrayerServiceException(error);
    }
  }
}
