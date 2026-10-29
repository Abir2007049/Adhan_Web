import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The current time, ticking every second while anything watches it.
final clockProvider = NotifierProvider.autoDispose<Clock, DateTime>(Clock.new);

class Clock extends Notifier<DateTime> {
  @override
  DateTime build() {
    final timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => state = DateTime.now(),
    );
    ref.onDispose(timer.cancel);
    return DateTime.now();
  }
}
