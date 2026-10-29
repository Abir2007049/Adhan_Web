// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Muslim Soul';

  @override
  String get appTagline => 'Prayer times and Adhan, kept beautifully.';

  @override
  String get navFeatures => 'Features';

  @override
  String get navPrayerTimes => 'Prayer times';

  @override
  String get navThemes => 'Themes';

  @override
  String get navLanguages => 'Languages';

  @override
  String get navFaq => 'FAQ';

  @override
  String get getTheApp => 'Get the app';

  @override
  String get languageMenuLabel => 'Language';

  @override
  String get themeModeLabel => 'Appearance';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get openMenu => 'Open menu';

  @override
  String get backToHome => 'Back to home';

  @override
  String get heroEyebrow => 'Prayer times · Adhan · Qibla';

  @override
  String get heroTitle => 'Keep every prayer, wherever you are';

  @override
  String get heroSubtitle =>
      'Accurate prayer times for your location, a gentle Adhan, the Qibla, the Quran and your daily duas, in one calm and beautiful app.';

  @override
  String get heroTryDemo => 'Try live prayer times';

  @override
  String get playBadgeTop => 'GET IT ON';

  @override
  String get storeLinkPending => 'Store listing coming soon';

  @override
  String get nextPrayer => 'Next prayer';

  @override
  String startsIn(String time) {
    return 'Starts in $time';
  }

  @override
  String get adhanOn => 'Adhan on';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Sunrise';

  @override
  String get prayerDhuhr => 'Dhuhr';

  @override
  String get prayerAsr => 'Asr';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isha';

  @override
  String get featuresTitle => 'Everything your day of prayer needs';

  @override
  String get featuresSubtitle =>
      'Thoughtful tools built around the five daily prayers.';

  @override
  String get featurePrayerTimesTitle => 'Accurate prayer times';

  @override
  String get featurePrayerTimesBody =>
      'Calculated for your exact GPS location, with a next-prayer card and a big clock.';

  @override
  String get featureAdhanTitle => 'Adhan and reminders';

  @override
  String get featureAdhanBody =>
      'A full Adhan alarm at each prayer time, plus notifications you control.';

  @override
  String get featureQiblaTitle => 'Qibla compass';

  @override
  String get featureQiblaBody =>
      'Find the direction of the Kaaba from wherever you stand.';

  @override
  String get featureQuranTitle => 'Quran reader';

  @override
  String get featureQuranBody =>
      'Read every surah and jump to any ayah by number or by name.';

  @override
  String get featureDuaTitle => 'Duas and Adhkar';

  @override
  String get featureDuaBody =>
      'Daily supplications and remembrance, set in clear Arabic type.';

  @override
  String get featureMosquesTitle => 'Nearby mosques';

  @override
  String get featureMosquesBody =>
      'Mosques around you, with jamat times and countdowns.';

  @override
  String get featureZakatTitle => 'Zakat calculator';

  @override
  String get featureZakatBody => 'Work out the Zakat you owe, step by step.';

  @override
  String get featureCalendarTitle => 'Hijri calendar';

  @override
  String get featureCalendarBody => 'Hijri and Gregorian dates side by side.';

  @override
  String get featureWeatherTitle => 'Weather';

  @override
  String get featureWeatherBody =>
      'Today\'s forecast on the home screen, alongside your prayers.';

  @override
  String get featureWidgetTitle => 'Home-screen widget';

  @override
  String get featureWidgetBody =>
      'See the next prayer without opening the app.';

  @override
  String get featureThemesTitle => 'Themes and icon styles';

  @override
  String get featureThemesBody =>
      'Twelve color themes and four 3D icon styles, in light and dark.';

  @override
  String get featureLanguagesTitle => 'Twelve languages';

  @override
  String get featureLanguagesBody =>
      'Native numerals and full right-to-left layouts.';

  @override
  String get readingTitle => 'Arabic text, set with care';

  @override
  String get readingBody =>
      'Quran and dua text uses dedicated Arabic typefaces, kept separate from the interface fonts.';

  @override
  String get readingAyahRef => 'Al-Fatihah 1:1';

  @override
  String get readingDuaRef => 'Al-Baqarah 2:201';

  @override
  String get demoTitle => 'See today\'s prayer times';

  @override
  String get demoSubtitle =>
      'Allow location or choose a city to see today\'s times, live.';

  @override
  String get demoUseLocation => 'Use my location';

  @override
  String get demoChooseCity => 'Choose a city';

  @override
  String get demoIdle => 'Your five daily prayers will appear here.';

  @override
  String get demoLoading => 'Getting prayer times…';

  @override
  String get demoErrorPermission =>
      'Location permission was denied. Choose a city instead, or allow location in your browser settings.';

  @override
  String get demoErrorUnavailable =>
      'We couldn\'t get your location. Check that location is on, or choose a city.';

  @override
  String get demoErrorNetwork =>
      'The prayer-time service didn\'t respond. Check your connection and try again.';

  @override
  String get demoRetry => 'Try again';

  @override
  String get demoMyLocation => 'Your location';

  @override
  String demoMethod(String method) {
    return 'Method: $method';
  }

  @override
  String demoTimezone(String zone) {
    return 'Time zone: $zone';
  }

  @override
  String get demoSource =>
      'Times from the Aladhan API, in the location\'s local time.';

  @override
  String get cityMakkah => 'Makkah';

  @override
  String get cityLondon => 'London';

  @override
  String get cityDhaka => 'Dhaka';

  @override
  String get cityKarachi => 'Karachi';

  @override
  String get cityNewDelhi => 'New Delhi';

  @override
  String get cityJakarta => 'Jakarta';

  @override
  String get cityKualaLumpur => 'Kuala Lumpur';

  @override
  String get cityIstanbul => 'Istanbul';

  @override
  String get cityTehran => 'Tehran';

  @override
  String get cityMogadishu => 'Mogadishu';

  @override
  String get cityParis => 'Paris';

  @override
  String get cityMoscow => 'Moscow';

  @override
  String get themesTitle => 'Twelve themes, light and dark';

  @override
  String get themesSubtitle =>
      'Pick a palette and the whole site changes with it, just like the app.';

  @override
  String get paletteViolet => 'Violet';

  @override
  String get paletteEmerald => 'Emerald';

  @override
  String get paletteGreen => 'Green';

  @override
  String get paletteRoseGold => 'Rose Gold';

  @override
  String get paletteDiSerria => 'Di Serria';

  @override
  String get paletteRose => 'Rose';

  @override
  String get palettePearl => 'Pearl';

  @override
  String get paletteDeepPlum => 'Deep Plum';

  @override
  String get palettePink => 'Pink';

  @override
  String get palettePurple => 'Purple';

  @override
  String get paletteAurora => 'Aurora';

  @override
  String get paletteDusk => 'Dusk';

  @override
  String get defaultBadge => 'Default';

  @override
  String get iconsTitle => 'Four icon styles';

  @override
  String get iconsSubtitle =>
      'Choose the 3D icon set you like, or let it match your theme.';

  @override
  String get iconStyleMatch => 'Match theme';

  @override
  String iconStyleMatchCaption(String style) {
    return 'Now: $style';
  }

  @override
  String get iconStyleClay => 'Glossy Clay';

  @override
  String get iconStyleGoldEmerald => 'Gold Emerald';

  @override
  String get iconStyleFrostedGlass => 'Frosted Glass';

  @override
  String get iconStyleNightGlow => 'Night Glow';

  @override
  String get languagesTitle => 'Speaks your language';

  @override
  String get languagesSubtitle =>
      'Twelve languages, with full right-to-left support for Arabic, Urdu and Persian.';

  @override
  String get rtlBadge => 'RTL';

  @override
  String get screenshotsTitle => 'A closer look';

  @override
  String get screenshotsSubtitle => 'Screens from the Android app.';

  @override
  String get screenshotPrevious => 'Previous screenshot';

  @override
  String get screenshotNext => 'Next screenshot';

  @override
  String get shotHome => 'Home';

  @override
  String get shotCompassStyles => 'Compass styles';

  @override
  String get shotMore => 'All features';

  @override
  String get faqTitle => 'Questions, answered';

  @override
  String get faqCalculationQ => 'How are prayer times calculated?';

  @override
  String get faqCalculationA =>
      'From your device\'s location, using established astronomical calculation methods. You can review the calculation settings under Prayer and Adhan settings in the app.';

  @override
  String get faqAdhanQ => 'What if my Adhan doesn\'t ring?';

  @override
  String get faqAdhanA =>
      'Some phones pause alarms to save battery. Open Reminder check-up in the app to make sure nothing is blocking your Adhan and notifications.';

  @override
  String get faqQiblaQ => 'How do I get an accurate Qibla direction?';

  @override
  String get faqQiblaA =>
      'Hold your phone flat, away from metal and magnets. If the accuracy drops, move the phone in a figure-8 to recalibrate the compass.';

  @override
  String get faqLanguagesQ => 'Which languages are supported?';

  @override
  String get faqLanguagesA =>
      'English, Bengali, Arabic, Urdu, Hindi, Indonesian, Malay, Turkish, Persian, Somali, French and Russian. Arabic, Urdu and Persian use right-to-left layouts.';

  @override
  String get faqLookQ => 'Can I change how the app looks?';

  @override
  String get faqLookA =>
      'Yes. Choose from twelve color themes in light or dark, and four 3D icon styles, or let the icons match your theme.';

  @override
  String get faqPlatformQ => 'Is there an iPhone version?';

  @override
  String get faqPlatformA =>
      'Muslim Soul is an Android app. On this website you can try live prayer times and the Qibla finder in your browser.';

  @override
  String get downloadTitle => 'Bring calm to every prayer time';

  @override
  String get downloadBody => 'Get Muslim Soul for Android on Google Play.';

  @override
  String get footerPrivacy => 'Privacy';

  @override
  String get footerTerms => 'Terms';

  @override
  String get footerContact => 'Contact';

  @override
  String get footerGithub => 'GitHub';

  @override
  String get footerQibla => 'Qibla finder';

  @override
  String footerCopyright(String year) {
    return '© $year Muslim Soul';
  }

  @override
  String get placeholderNotice =>
      'Placeholder text. Replace before publishing.';

  @override
  String get privacyTitle => 'Privacy policy';

  @override
  String get privacyP1 =>
      'This page explains what information the Muslim Soul website and app use, and why.';

  @override
  String get privacyP2 =>
      'If you share your location for the prayer-times demo, your coordinates are sent to the Aladhan API to calculate the times. Your settings, such as theme and language, are stored in your own browser.';

  @override
  String get privacyP3 =>
      'Questions about privacy? Contact us using the link at the bottom of this page.';

  @override
  String get termsTitle => 'Terms of use';

  @override
  String get termsP1 =>
      'By using the Muslim Soul website or app, you agree to these terms.';

  @override
  String get termsP2 =>
      'Prayer times, Qibla direction and other calculations are provided in good faith. Please confirm with your local mosque where accuracy matters.';

  @override
  String get termsP3 =>
      'We may update these terms from time to time. The latest version will always be on this page.';

  @override
  String get qiblaTitle => 'Qibla finder';

  @override
  String get qiblaSubtitle =>
      'Enter coordinates to find the direction of the Kaaba from true north.';

  @override
  String get qiblaLatitude => 'Latitude';

  @override
  String get qiblaLongitude => 'Longitude';

  @override
  String get qiblaCalculate => 'Find the Qibla';

  @override
  String qiblaResult(String degrees) {
    return '$degrees° from true north';
  }

  @override
  String qiblaDistance(String km) {
    return '$km km to the Kaaba';
  }

  @override
  String get qiblaHint => 'Face true north, then turn clockwise by this angle.';

  @override
  String get qiblaInvalid =>
      'Enter a latitude from -90 to 90 and a longitude from -180 to 180.';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get notFoundBody => 'The page you\'re looking for doesn\'t exist.';
}
