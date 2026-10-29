import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_soul_web/features/prayer_demo/data/aladhan_client.dart';
import 'package:muslim_soul_web/features/prayer_demo/domain/makkah_schedule.dart';
import 'package:muslim_soul_web/features/prayer_demo/domain/prayer.dart';
import 'package:muslim_soul_web/features/qibla/qibla_math.dart';

void main() {
  group('MakkahSchedule', () {
    int minutes(ClockTime t) => t.hour * 60 + t.minute;

    test('lists the day in order and counts down to a later prayer', () {
      // Every hour of a day, in UTC.
      for (var hour = 0; hour < 24; hour++) {
        final now = DateTime.utc(2026, 10, 30, hour, 17);
        final s = MakkahSchedule.at(now);
        final order = Prayer.values.map((p) => minutes(s.times[p]!)).toList();
        expect(order, orderedEquals([...order]..sort()), reason: 'hour $hour');
        expect(s.next.isSalah, isTrue);
        expect(s.remaining, greaterThan(Duration.zero));
        expect(s.remaining, lessThan(const Duration(hours: 24)));
      }
    });

    test('shows Makkah wall-clock time (UTC+3)', () {
      final s = MakkahSchedule.at(DateTime.utc(2026, 10, 30, 9, 0));
      expect(s.makkahNow.hour, 12);
    });

    test('rolls over to tomorrow\'s Fajr after Isha', () {
      // 23:30 in Makkah.
      final s = MakkahSchedule.at(DateTime.utc(2026, 10, 30, 20, 30));
      expect(s.next, Prayer.fajr);
    });
  });

  group('Qibla', () {
    // Reference bearings from the adhan library's own test suite.
    test('matches known bearings', () {
      expect(qiblaFrom(40.7128, -74.0059).bearing, closeTo(58.4817, 0.01));
      expect(qiblaFrom(51.5074, -0.1278).bearing, closeTo(118.987, 0.01));
      expect(qiblaFrom(-33.8688, 151.2093).bearing, closeTo(277.4996, 0.01));
    });

    test('measures a plausible great-circle distance', () {
      expect(
        qiblaFrom(51.5074, -0.1278).distanceKm,
        inInclusiveRange(4700, 4900),
      );
      expect(
        qiblaFrom(kaabaLatitude, kaabaLongitude).distanceKm,
        lessThan(0.001),
      );
    });

    test('validates coordinate ranges', () {
      expect(isValidCoordinate(90, 180), isTrue);
      expect(isValidCoordinate(-90.1, 0), isFalse);
      expect(isValidCoordinate(0, 181), isFalse);
    });
  });

  test('parses an Aladhan timings response', () {
    final day = PrayerDay.fromAladhan({
      'timings': {
        'Fajr': '04:49',
        'Sunrise': '06:05',
        'Dhuhr': '11:46',
        'Asr': '15:01',
        'Maghrib': '17:25',
        'Isha': '18:41 (+06)',
      },
      'date': {
        'hijri': {
          'day': '19',
          'month': {'number': 5, 'en': 'Jumādá al-ūlá', 'ar': 'جُمادى الأولى'},
          'year': '1448',
        },
        'gregorian': {
          'day': '30',
          'month': {'number': 10, 'en': 'October'},
          'year': '2026',
        },
      },
      'meta': {
        'timezone': 'Asia/Dhaka',
        'method': {'id': 1, 'name': 'University of Islamic Sciences, Karachi'},
      },
    });
    expect(day.times[Prayer.fajr], (hour: 4, minute: 49));
    expect(day.times[Prayer.isha], (hour: 18, minute: 41));
    expect(day.date, DateTime(2026, 10, 30));
    expect(day.hijriDay, 19);
    expect(day.hijriYear, 1448);
    expect(day.timezone, 'Asia/Dhaka');
    expect(day.method, startsWith('University'));
  });
}
