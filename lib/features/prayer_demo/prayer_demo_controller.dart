import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/device_location.dart';
import 'data/aladhan_client.dart';
import 'data/demo_city.dart';

@immutable
class PrayerDemoState {
  const PrayerDemoState({this.city, this.result});

  /// The chosen city, or null when using the visitor's location.
  final DemoCity? city;

  /// Null until the visitor picks a location.
  final AsyncValue<PrayerDay>? result;
}

final prayerDemoProvider =
    NotifierProvider<PrayerDemoController, PrayerDemoState>(
      PrayerDemoController.new,
    );

class PrayerDemoController extends Notifier<PrayerDemoState> {
  Future<void> Function()? _lastRequest;
  int _generation = 0;

  @override
  PrayerDemoState build() => const PrayerDemoState();

  Future<void> useMyLocation() => _load(null, () async {
    final here = await ref.read(deviceLocationProvider).current();
    return ref.read(aladhanClientProvider).today(here.latitude, here.longitude);
  });

  Future<void> chooseCity(DemoCity city) => _load(
    city,
    () => ref.read(aladhanClientProvider).today(city.latitude, city.longitude),
  );

  Future<void> retry() => _lastRequest?.call() ?? Future.value();

  Future<void> _load(DemoCity? city, Future<PrayerDay> Function() fetch) async {
    _lastRequest = () => _load(city, fetch);
    final generation = ++_generation;
    state = PrayerDemoState(city: city, result: const AsyncLoading());
    final result = await AsyncValue.guard(fetch);
    // Drop results that a newer request has superseded.
    if (!ref.mounted || generation != _generation) return;
    state = PrayerDemoState(city: city, result: result);
  }
}
