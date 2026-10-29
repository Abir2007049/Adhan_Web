import 'dart:math' as math;

import 'package:adhan/adhan.dart' as adhan;

typedef QiblaResult = ({double bearing, double distanceKm});

/// The Kaaba, matching the coordinates the `adhan` package uses.
const kaabaLatitude = 21.4225241;
const kaabaLongitude = 39.8261818;

bool isValidCoordinate(double latitude, double longitude) =>
    latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180;

/// Great-circle bearing to the Kaaba, clockwise from true north in degrees
/// (0 to 360), and the distance to it.
QiblaResult qiblaFrom(double latitude, double longitude) {
  final bearing = adhan.Qibla(adhan.Coordinates(latitude, longitude)).direction;
  return (
    bearing: bearing % 360,
    distanceKm: _haversineKm(
      latitude,
      longitude,
      kaabaLatitude,
      kaabaLongitude,
    ),
  );
}

double _haversineKm(double lat1, double lon1, double lat2, double lon2) {
  const earthRadiusKm = 6371.0088;
  double rad(double degrees) => degrees * math.pi / 180;
  final dLat = rad(lat2 - lat1);
  final dLon = rad(lon2 - lon1);
  final a =
      math.pow(math.sin(dLat / 2), 2) +
      math.cos(rad(lat1)) *
          math.cos(rad(lat2)) *
          math.pow(math.sin(dLon / 2), 2);
  return 2 * earthRadiusKm * math.asin(math.sqrt(a));
}
