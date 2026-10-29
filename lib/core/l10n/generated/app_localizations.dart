import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_so.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('en'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ms'),
    Locale('ru'),
    Locale('so'),
    Locale('tr'),
    Locale('ur'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Muslim Soul'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Prayer times and Adhan, kept beautifully.'**
  String get appTagline;

  /// No description provided for @navFeatures.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get navFeatures;

  /// No description provided for @navPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prayer times'**
  String get navPrayerTimes;

  /// No description provided for @navThemes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get navThemes;

  /// No description provided for @navLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get navLanguages;

  /// No description provided for @navFaq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get navFaq;

  /// No description provided for @getTheApp.
  ///
  /// In en, this message translates to:
  /// **'Get the app'**
  String get getTheApp;

  /// No description provided for @languageMenuLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageMenuLabel;

  /// No description provided for @themeModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get themeModeLabel;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeModeSystem;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

  /// No description provided for @openMenu.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get openMenu;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Prayer times · Adhan · Qibla'**
  String get heroEyebrow;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep every prayer, wherever you are'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Accurate prayer times for your location, a gentle Adhan, the Qibla, the Quran and your daily duas, in one calm and beautiful app.'**
  String get heroSubtitle;

  /// No description provided for @heroTryDemo.
  ///
  /// In en, this message translates to:
  /// **'Try live prayer times'**
  String get heroTryDemo;

  /// No description provided for @playBadgeTop.
  ///
  /// In en, this message translates to:
  /// **'GET IT ON'**
  String get playBadgeTop;

  /// No description provided for @storeLinkPending.
  ///
  /// In en, this message translates to:
  /// **'Store listing coming soon'**
  String get storeLinkPending;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'Next prayer'**
  String get nextPrayer;

  /// Countdown to the next prayer. time is HH:MM:SS.
  ///
  /// In en, this message translates to:
  /// **'Starts in {time}'**
  String startsIn(String time);

  /// No description provided for @adhanOn.
  ///
  /// In en, this message translates to:
  /// **'Adhan on'**
  String get adhanOn;

  /// No description provided for @prayerFajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get prayerFajr;

  /// No description provided for @prayerSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get prayerSunrise;

  /// No description provided for @prayerDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get prayerDhuhr;

  /// No description provided for @prayerAsr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get prayerAsr;

  /// No description provided for @prayerMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get prayerMaghrib;

  /// No description provided for @prayerIsha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get prayerIsha;

  /// No description provided for @featuresTitle.
  ///
  /// In en, this message translates to:
  /// **'Everything your day of prayer needs'**
  String get featuresTitle;

  /// No description provided for @featuresSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Thoughtful tools built around the five daily prayers.'**
  String get featuresSubtitle;

  /// No description provided for @featurePrayerTimesTitle.
  ///
  /// In en, this message translates to:
  /// **'Accurate prayer times'**
  String get featurePrayerTimesTitle;

  /// No description provided for @featurePrayerTimesBody.
  ///
  /// In en, this message translates to:
  /// **'Calculated for your exact GPS location, with a next-prayer card and a big clock.'**
  String get featurePrayerTimesBody;

  /// No description provided for @featureAdhanTitle.
  ///
  /// In en, this message translates to:
  /// **'Adhan and reminders'**
  String get featureAdhanTitle;

  /// No description provided for @featureAdhanBody.
  ///
  /// In en, this message translates to:
  /// **'A full Adhan alarm at each prayer time, plus notifications you control.'**
  String get featureAdhanBody;

  /// No description provided for @featureQiblaTitle.
  ///
  /// In en, this message translates to:
  /// **'Qibla compass'**
  String get featureQiblaTitle;

  /// No description provided for @featureQiblaBody.
  ///
  /// In en, this message translates to:
  /// **'Find the direction of the Kaaba from wherever you stand.'**
  String get featureQiblaBody;

  /// No description provided for @featureQuranTitle.
  ///
  /// In en, this message translates to:
  /// **'Quran reader'**
  String get featureQuranTitle;

  /// No description provided for @featureQuranBody.
  ///
  /// In en, this message translates to:
  /// **'Read every surah and jump to any ayah by number or by name.'**
  String get featureQuranBody;

  /// No description provided for @featureDuaTitle.
  ///
  /// In en, this message translates to:
  /// **'Duas and Adhkar'**
  String get featureDuaTitle;

  /// No description provided for @featureDuaBody.
  ///
  /// In en, this message translates to:
  /// **'Daily supplications and remembrance, set in clear Arabic type.'**
  String get featureDuaBody;

  /// No description provided for @featureMosquesTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby mosques'**
  String get featureMosquesTitle;

  /// No description provided for @featureMosquesBody.
  ///
  /// In en, this message translates to:
  /// **'Mosques around you, with jamat times and countdowns.'**
  String get featureMosquesBody;

  /// No description provided for @featureZakatTitle.
  ///
  /// In en, this message translates to:
  /// **'Zakat calculator'**
  String get featureZakatTitle;

  /// No description provided for @featureZakatBody.
  ///
  /// In en, this message translates to:
  /// **'Work out the Zakat you owe, step by step.'**
  String get featureZakatBody;

  /// No description provided for @featureCalendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Hijri calendar'**
  String get featureCalendarTitle;

  /// No description provided for @featureCalendarBody.
  ///
  /// In en, this message translates to:
  /// **'Hijri and Gregorian dates side by side.'**
  String get featureCalendarBody;

  /// No description provided for @featureWeatherTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get featureWeatherTitle;

  /// No description provided for @featureWeatherBody.
  ///
  /// In en, this message translates to:
  /// **'Today\'s forecast on the home screen, alongside your prayers.'**
  String get featureWeatherBody;

  /// No description provided for @featureWidgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Home-screen widget'**
  String get featureWidgetTitle;

  /// No description provided for @featureWidgetBody.
  ///
  /// In en, this message translates to:
  /// **'See the next prayer without opening the app.'**
  String get featureWidgetBody;

  /// No description provided for @featureThemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Themes and icon styles'**
  String get featureThemesTitle;

  /// No description provided for @featureThemesBody.
  ///
  /// In en, this message translates to:
  /// **'Twelve color themes and four 3D icon styles, in light and dark.'**
  String get featureThemesBody;

  /// No description provided for @featureLanguagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Twelve languages'**
  String get featureLanguagesTitle;

  /// No description provided for @featureLanguagesBody.
  ///
  /// In en, this message translates to:
  /// **'Native numerals and full right-to-left layouts.'**
  String get featureLanguagesBody;

  /// No description provided for @readingTitle.
  ///
  /// In en, this message translates to:
  /// **'Arabic text, set with care'**
  String get readingTitle;

  /// No description provided for @readingBody.
  ///
  /// In en, this message translates to:
  /// **'Quran and dua text uses dedicated Arabic typefaces, kept separate from the interface fonts.'**
  String get readingBody;

  /// No description provided for @readingAyahRef.
  ///
  /// In en, this message translates to:
  /// **'Al-Fatihah 1:1'**
  String get readingAyahRef;

  /// No description provided for @readingDuaRef.
  ///
  /// In en, this message translates to:
  /// **'Al-Baqarah 2:201'**
  String get readingDuaRef;

  /// No description provided for @demoTitle.
  ///
  /// In en, this message translates to:
  /// **'See today\'s prayer times'**
  String get demoTitle;

  /// No description provided for @demoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow location or choose a city to see today\'s times, live.'**
  String get demoSubtitle;

  /// No description provided for @demoUseLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get demoUseLocation;

  /// No description provided for @demoChooseCity.
  ///
  /// In en, this message translates to:
  /// **'Choose a city'**
  String get demoChooseCity;

  /// No description provided for @demoIdle.
  ///
  /// In en, this message translates to:
  /// **'Your five daily prayers will appear here.'**
  String get demoIdle;

  /// No description provided for @demoLoading.
  ///
  /// In en, this message translates to:
  /// **'Getting prayer times…'**
  String get demoLoading;

  /// No description provided for @demoErrorPermission.
  ///
  /// In en, this message translates to:
  /// **'Location permission was denied. Choose a city instead, or allow location in your browser settings.'**
  String get demoErrorPermission;

  /// No description provided for @demoErrorUnavailable.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t get your location. Check that location is on, or choose a city.'**
  String get demoErrorUnavailable;

  /// No description provided for @demoErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'The prayer-time service didn\'t respond. Check your connection and try again.'**
  String get demoErrorNetwork;

  /// No description provided for @demoRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get demoRetry;

  /// No description provided for @demoMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Your location'**
  String get demoMyLocation;

  /// No description provided for @demoMethod.
  ///
  /// In en, this message translates to:
  /// **'Method: {method}'**
  String demoMethod(String method);

  /// No description provided for @demoTimezone.
  ///
  /// In en, this message translates to:
  /// **'Time zone: {zone}'**
  String demoTimezone(String zone);

  /// No description provided for @demoSource.
  ///
  /// In en, this message translates to:
  /// **'Times from the Aladhan API, in the location\'s local time.'**
  String get demoSource;

  /// No description provided for @cityMakkah.
  ///
  /// In en, this message translates to:
  /// **'Makkah'**
  String get cityMakkah;

  /// No description provided for @cityLondon.
  ///
  /// In en, this message translates to:
  /// **'London'**
  String get cityLondon;

  /// No description provided for @cityDhaka.
  ///
  /// In en, this message translates to:
  /// **'Dhaka'**
  String get cityDhaka;

  /// No description provided for @cityKarachi.
  ///
  /// In en, this message translates to:
  /// **'Karachi'**
  String get cityKarachi;

  /// No description provided for @cityNewDelhi.
  ///
  /// In en, this message translates to:
  /// **'New Delhi'**
  String get cityNewDelhi;

  /// No description provided for @cityJakarta.
  ///
  /// In en, this message translates to:
  /// **'Jakarta'**
  String get cityJakarta;

  /// No description provided for @cityKualaLumpur.
  ///
  /// In en, this message translates to:
  /// **'Kuala Lumpur'**
  String get cityKualaLumpur;

  /// No description provided for @cityIstanbul.
  ///
  /// In en, this message translates to:
  /// **'Istanbul'**
  String get cityIstanbul;

  /// No description provided for @cityTehran.
  ///
  /// In en, this message translates to:
  /// **'Tehran'**
  String get cityTehran;

  /// No description provided for @cityMogadishu.
  ///
  /// In en, this message translates to:
  /// **'Mogadishu'**
  String get cityMogadishu;

  /// No description provided for @cityParis.
  ///
  /// In en, this message translates to:
  /// **'Paris'**
  String get cityParis;

  /// No description provided for @cityMoscow.
  ///
  /// In en, this message translates to:
  /// **'Moscow'**
  String get cityMoscow;

  /// No description provided for @themesTitle.
  ///
  /// In en, this message translates to:
  /// **'Twelve themes, light and dark'**
  String get themesTitle;

  /// No description provided for @themesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a palette and the whole site changes with it, just like the app.'**
  String get themesSubtitle;

  /// No description provided for @paletteViolet.
  ///
  /// In en, this message translates to:
  /// **'Violet'**
  String get paletteViolet;

  /// No description provided for @paletteEmerald.
  ///
  /// In en, this message translates to:
  /// **'Emerald'**
  String get paletteEmerald;

  /// No description provided for @paletteGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get paletteGreen;

  /// No description provided for @paletteRoseGold.
  ///
  /// In en, this message translates to:
  /// **'Rose Gold'**
  String get paletteRoseGold;

  /// No description provided for @paletteDiSerria.
  ///
  /// In en, this message translates to:
  /// **'Di Serria'**
  String get paletteDiSerria;

  /// No description provided for @paletteRose.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get paletteRose;

  /// No description provided for @palettePearl.
  ///
  /// In en, this message translates to:
  /// **'Pearl'**
  String get palettePearl;

  /// No description provided for @paletteDeepPlum.
  ///
  /// In en, this message translates to:
  /// **'Deep Plum'**
  String get paletteDeepPlum;

  /// No description provided for @palettePink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get palettePink;

  /// No description provided for @palettePurple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get palettePurple;

  /// No description provided for @paletteAurora.
  ///
  /// In en, this message translates to:
  /// **'Aurora'**
  String get paletteAurora;

  /// No description provided for @paletteDusk.
  ///
  /// In en, this message translates to:
  /// **'Dusk'**
  String get paletteDusk;

  /// No description provided for @defaultBadge.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultBadge;

  /// No description provided for @iconsTitle.
  ///
  /// In en, this message translates to:
  /// **'Four icon styles'**
  String get iconsTitle;

  /// No description provided for @iconsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the 3D icon set you like, or let it match your theme.'**
  String get iconsSubtitle;

  /// No description provided for @iconStyleMatch.
  ///
  /// In en, this message translates to:
  /// **'Match theme'**
  String get iconStyleMatch;

  /// No description provided for @iconStyleMatchCaption.
  ///
  /// In en, this message translates to:
  /// **'Now: {style}'**
  String iconStyleMatchCaption(String style);

  /// No description provided for @iconStyleClay.
  ///
  /// In en, this message translates to:
  /// **'Glossy Clay'**
  String get iconStyleClay;

  /// No description provided for @iconStyleGoldEmerald.
  ///
  /// In en, this message translates to:
  /// **'Gold Emerald'**
  String get iconStyleGoldEmerald;

  /// No description provided for @iconStyleFrostedGlass.
  ///
  /// In en, this message translates to:
  /// **'Frosted Glass'**
  String get iconStyleFrostedGlass;

  /// No description provided for @iconStyleNightGlow.
  ///
  /// In en, this message translates to:
  /// **'Night Glow'**
  String get iconStyleNightGlow;

  /// No description provided for @languagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Speaks your language'**
  String get languagesTitle;

  /// No description provided for @languagesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Twelve languages, with full right-to-left support for Arabic, Urdu and Persian.'**
  String get languagesSubtitle;

  /// No description provided for @rtlBadge.
  ///
  /// In en, this message translates to:
  /// **'RTL'**
  String get rtlBadge;

  /// No description provided for @screenshotsTitle.
  ///
  /// In en, this message translates to:
  /// **'A closer look'**
  String get screenshotsTitle;

  /// No description provided for @screenshotsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Screens from the Android app.'**
  String get screenshotsSubtitle;

  /// No description provided for @screenshotPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous screenshot'**
  String get screenshotPrevious;

  /// No description provided for @screenshotNext.
  ///
  /// In en, this message translates to:
  /// **'Next screenshot'**
  String get screenshotNext;

  /// No description provided for @shotHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get shotHome;

  /// No description provided for @shotCompassStyles.
  ///
  /// In en, this message translates to:
  /// **'Compass styles'**
  String get shotCompassStyles;

  /// No description provided for @shotMore.
  ///
  /// In en, this message translates to:
  /// **'All features'**
  String get shotMore;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'Questions, answered'**
  String get faqTitle;

  /// No description provided for @faqCalculationQ.
  ///
  /// In en, this message translates to:
  /// **'How are prayer times calculated?'**
  String get faqCalculationQ;

  /// No description provided for @faqCalculationA.
  ///
  /// In en, this message translates to:
  /// **'From your device\'s location, using established astronomical calculation methods. You can review the calculation settings under Prayer and Adhan settings in the app.'**
  String get faqCalculationA;

  /// No description provided for @faqAdhanQ.
  ///
  /// In en, this message translates to:
  /// **'What if my Adhan doesn\'t ring?'**
  String get faqAdhanQ;

  /// No description provided for @faqAdhanA.
  ///
  /// In en, this message translates to:
  /// **'Some phones pause alarms to save battery. Open Reminder check-up in the app to make sure nothing is blocking your Adhan and notifications.'**
  String get faqAdhanA;

  /// No description provided for @faqQiblaQ.
  ///
  /// In en, this message translates to:
  /// **'How do I get an accurate Qibla direction?'**
  String get faqQiblaQ;

  /// No description provided for @faqQiblaA.
  ///
  /// In en, this message translates to:
  /// **'Hold your phone flat, away from metal and magnets. If the accuracy drops, move the phone in a figure-8 to recalibrate the compass.'**
  String get faqQiblaA;

  /// No description provided for @faqLanguagesQ.
  ///
  /// In en, this message translates to:
  /// **'Which languages are supported?'**
  String get faqLanguagesQ;

  /// No description provided for @faqLanguagesA.
  ///
  /// In en, this message translates to:
  /// **'English, Bengali, Arabic, Urdu, Hindi, Indonesian, Malay, Turkish, Persian, Somali, French and Russian. Arabic, Urdu and Persian use right-to-left layouts.'**
  String get faqLanguagesA;

  /// No description provided for @faqLookQ.
  ///
  /// In en, this message translates to:
  /// **'Can I change how the app looks?'**
  String get faqLookQ;

  /// No description provided for @faqLookA.
  ///
  /// In en, this message translates to:
  /// **'Yes. Choose from twelve color themes in light or dark, and four 3D icon styles, or let the icons match your theme.'**
  String get faqLookA;

  /// No description provided for @faqPlatformQ.
  ///
  /// In en, this message translates to:
  /// **'Is there an iPhone version?'**
  String get faqPlatformQ;

  /// No description provided for @faqPlatformA.
  ///
  /// In en, this message translates to:
  /// **'Muslim Soul is an Android app. On this website you can try live prayer times and the Qibla finder in your browser.'**
  String get faqPlatformA;

  /// No description provided for @downloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Bring calm to every prayer time'**
  String get downloadTitle;

  /// No description provided for @downloadBody.
  ///
  /// In en, this message translates to:
  /// **'Get Muslim Soul for Android on Google Play.'**
  String get downloadBody;

  /// No description provided for @footerPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get footerPrivacy;

  /// No description provided for @footerTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get footerTerms;

  /// No description provided for @footerContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get footerContact;

  /// No description provided for @footerGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get footerGithub;

  /// No description provided for @footerQibla.
  ///
  /// In en, this message translates to:
  /// **'Qibla finder'**
  String get footerQibla;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} Muslim Soul'**
  String footerCopyright(String year);

  /// No description provided for @placeholderNotice.
  ///
  /// In en, this message translates to:
  /// **'Placeholder text. Replace before publishing.'**
  String get placeholderNotice;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyTitle;

  /// No description provided for @privacyP1.
  ///
  /// In en, this message translates to:
  /// **'This page explains what information the Muslim Soul website and app use, and why.'**
  String get privacyP1;

  /// No description provided for @privacyP2.
  ///
  /// In en, this message translates to:
  /// **'If you share your location for the prayer-times demo, your coordinates are sent to the Aladhan API to calculate the times. Your settings, such as theme and language, are stored in your own browser.'**
  String get privacyP2;

  /// No description provided for @privacyP3.
  ///
  /// In en, this message translates to:
  /// **'Questions about privacy? Contact us using the link at the bottom of this page.'**
  String get privacyP3;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsTitle;

  /// No description provided for @termsP1.
  ///
  /// In en, this message translates to:
  /// **'By using the Muslim Soul website or app, you agree to these terms.'**
  String get termsP1;

  /// No description provided for @termsP2.
  ///
  /// In en, this message translates to:
  /// **'Prayer times, Qibla direction and other calculations are provided in good faith. Please confirm with your local mosque where accuracy matters.'**
  String get termsP2;

  /// No description provided for @termsP3.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms from time to time. The latest version will always be on this page.'**
  String get termsP3;

  /// No description provided for @qiblaTitle.
  ///
  /// In en, this message translates to:
  /// **'Qibla finder'**
  String get qiblaTitle;

  /// No description provided for @qiblaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter coordinates to find the direction of the Kaaba from true north.'**
  String get qiblaSubtitle;

  /// No description provided for @qiblaLatitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get qiblaLatitude;

  /// No description provided for @qiblaLongitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get qiblaLongitude;

  /// No description provided for @qiblaCalculate.
  ///
  /// In en, this message translates to:
  /// **'Find the Qibla'**
  String get qiblaCalculate;

  /// No description provided for @qiblaResult.
  ///
  /// In en, this message translates to:
  /// **'{degrees}° from true north'**
  String qiblaResult(String degrees);

  /// No description provided for @qiblaDistance.
  ///
  /// In en, this message translates to:
  /// **'{km} km to the Kaaba'**
  String qiblaDistance(String km);

  /// No description provided for @qiblaHint.
  ///
  /// In en, this message translates to:
  /// **'Face true north, then turn clockwise by this angle.'**
  String get qiblaHint;

  /// No description provided for @qiblaInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a latitude from -90 to 90 and a longitude from -180 to 180.'**
  String get qiblaInvalid;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundTitle;

  /// No description provided for @notFoundBody.
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist.'**
  String get notFoundBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'en',
    'fa',
    'fr',
    'hi',
    'id',
    'ms',
    'ru',
    'so',
    'tr',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'ms':
      return AppLocalizationsMs();
    case 'ru':
      return AppLocalizationsRu();
    case 'so':
      return AppLocalizationsSo();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
