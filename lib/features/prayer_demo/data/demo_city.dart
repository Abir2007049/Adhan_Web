import '../../../core/l10n/generated/app_localizations.dart';

/// Cities offered in the demo, roughly one per supported language.
enum DemoCity {
  makkah(21.4225, 39.8262),
  london(51.5074, -0.1278),
  dhaka(23.8103, 90.4125),
  karachi(24.8607, 67.0011),
  newDelhi(28.6139, 77.2090),
  jakarta(-6.2088, 106.8456),
  kualaLumpur(3.1390, 101.6869),
  istanbul(41.0082, 28.9784),
  tehran(35.6892, 51.3890),
  mogadishu(2.0469, 45.3182),
  paris(48.8566, 2.3522),
  moscow(55.7558, 37.6173);

  const DemoCity(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  String label(AppLocalizations l10n) => switch (this) {
    makkah => l10n.cityMakkah,
    london => l10n.cityLondon,
    dhaka => l10n.cityDhaka,
    karachi => l10n.cityKarachi,
    newDelhi => l10n.cityNewDelhi,
    jakarta => l10n.cityJakarta,
    kualaLumpur => l10n.cityKualaLumpur,
    istanbul => l10n.cityIstanbul,
    tehran => l10n.cityTehran,
    mogadishu => l10n.cityMogadishu,
    paris => l10n.cityParis,
    moscow => l10n.cityMoscow,
  };
}
