import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

typedef LatLng = ({double latitude, double longitude});

/// Why the browser couldn't give us a position.
class LocationException implements Exception {
  const LocationException({required this.denied});

  /// True when the visitor (or browser policy) refused permission.
  final bool denied;
}

final deviceLocationProvider = Provider<DeviceLocation>(
  (ref) => const DeviceLocation(),
);

/// Asks the browser for a coarse position (city-level is plenty for prayer
/// times and the Qibla).
class DeviceLocation {
  const DeviceLocation();

  Future<LatLng> current() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const LocationException(denied: true);
    }
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 15),
        ),
      );
      return (latitude: position.latitude, longitude: position.longitude);
    } on PermissionDeniedException {
      throw const LocationException(denied: true);
    } catch (_) {
      throw const LocationException(denied: false);
    }
  }
}
