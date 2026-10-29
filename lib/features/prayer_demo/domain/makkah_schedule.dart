import 'package:adhan/adhan.dart' as adhan;

import 'prayer.dart';

/// A moment on the hero's Salah card: today's times in Makkah and the
/// countdown to the next prayer.
class SalahSnapshot {
  const SalahSnapshot({
    required this.makkahNow,
    required this.times,
    required this.next,
    required this.nextTime,
    required this.remaining,
  });

  /// Wall-clock time in Makkah (fields hold Makkah local time).
  final DateTime makkahNow;

  /// Today's times in Makkah, Fajr through Isha.
  final Map<Prayer, ClockTime> times;

  final Prayer next;
  final ClockTime nextTime;
  final Duration remaining;
}

/// Prayer times for Makkah, calculated on-device with the Umm al-Qura
/// method. Makkah stays on UTC+3 year round (no daylight saving), so the
/// card shows real Makkah times whatever the visitor's own time zone.
abstract final class MakkahSchedule {
  static const utcOffset = Duration(hours: 3);
  static final _coordinates = adhan.Coordinates(21.4225, 39.8262);
  static final _params = adhan.CalculationMethod.umm_al_qura.getParameters();

  static SalahSnapshot at(DateTime now) {
    final utcNow = now.toUtc();
    final makkahNow = utcNow.add(utcOffset);
    final today = _instants(makkahNow);

    var next = today.entries
        .where((e) => e.key.isSalah && e.value.isAfter(utcNow))
        .firstOrNull;
    next ??= MapEntry(
      Prayer.fajr,
      _instants(makkahNow.add(const Duration(days: 1)))[Prayer.fajr]!,
    );

    return SalahSnapshot(
      makkahNow: makkahNow,
      times: today.map((prayer, at) => MapEntry(prayer, _wallClock(at))),
      next: next.key,
      nextTime: _wallClock(next.value),
      remaining: next.value.difference(utcNow),
    );
  }

  /// UTC instants of each prayer on the Makkah calendar day of [makkahDay].
  static Map<Prayer, DateTime> _instants(DateTime makkahDay) {
    final times = adhan.PrayerTimes.utc(
      _coordinates,
      adhan.DateComponents(makkahDay.year, makkahDay.month, makkahDay.day),
      _params,
    );
    return {
      Prayer.fajr: times.fajr,
      Prayer.sunrise: times.sunrise,
      Prayer.dhuhr: times.dhuhr,
      Prayer.asr: times.asr,
      Prayer.maghrib: times.maghrib,
      Prayer.isha: times.isha,
    };
  }

  static ClockTime _wallClock(DateTime utc) {
    final local = utc.toUtc().add(utcOffset);
    return (hour: local.hour, minute: local.minute);
  }
}
