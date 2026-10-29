// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Muslim Soul';

  @override
  String get appTagline => 'Heures de prière et adhan, avec soin.';

  @override
  String get navFeatures => 'Fonctionnalités';

  @override
  String get navPrayerTimes => 'Heures de prière';

  @override
  String get navThemes => 'Thèmes';

  @override
  String get navLanguages => 'Langues';

  @override
  String get navFaq => 'FAQ';

  @override
  String get getTheApp => 'Obtenir l\'application';

  @override
  String get languageMenuLabel => 'Langue';

  @override
  String get themeModeLabel => 'Apparence';

  @override
  String get themeModeSystem => 'Système';

  @override
  String get themeModeLight => 'Clair';

  @override
  String get themeModeDark => 'Sombre';

  @override
  String get openMenu => 'Ouvrir le menu';

  @override
  String get backToHome => 'Retour à l\'accueil';

  @override
  String get heroEyebrow => 'Heures de prière · Adhan · Qibla';

  @override
  String get heroTitle => 'Accomplissez chaque prière, où que vous soyez';

  @override
  String get heroSubtitle =>
      'Des heures de prière précises pour votre position, un adhan apaisant, la qibla, le Coran et vos douas quotidiennes, réunis dans une application calme et élégante.';

  @override
  String get heroTryDemo => 'Essayer les horaires en direct';

  @override
  String get playBadgeTop => 'DISPONIBLE SUR';

  @override
  String get storeLinkPending => 'Lien vers la boutique bientôt disponible';

  @override
  String get nextPrayer => 'Prochaine prière';

  @override
  String startsIn(String time) {
    return 'Commence dans $time';
  }

  @override
  String get adhanOn => 'Adhan activé';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Lever du soleil';

  @override
  String get prayerDhuhr => 'Dhuhr';

  @override
  String get prayerAsr => 'Asr';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isha';

  @override
  String get featuresTitle => 'Tout ce dont votre journée de prière a besoin';

  @override
  String get featuresSubtitle =>
      'Des outils soignés, pensés autour des cinq prières quotidiennes.';

  @override
  String get featurePrayerTimesTitle => 'Heures de prière précises';

  @override
  String get featurePrayerTimesBody =>
      'Calculées pour votre position GPS exacte, avec une carte de la prochaine prière et une grande horloge.';

  @override
  String get featureAdhanTitle => 'Adhan et rappels';

  @override
  String get featureAdhanBody =>
      'Une alarme d\'adhan complète à chaque prière, et des notifications que vous contrôlez.';

  @override
  String get featureQiblaTitle => 'Boussole de la qibla';

  @override
  String get featureQiblaBody =>
      'Trouvez la direction de la Kaaba où que vous soyez.';

  @override
  String get featureQuranTitle => 'Lecteur du Coran';

  @override
  String get featureQuranBody =>
      'Lisez chaque sourate et accédez à n\'importe quel verset par son numéro ou son nom.';

  @override
  String get featureDuaTitle => 'Douas et adhkar';

  @override
  String get featureDuaBody =>
      'Invocations et rappels quotidiens, dans une écriture arabe lisible.';

  @override
  String get featureMosquesTitle => 'Mosquées à proximité';

  @override
  String get featureMosquesBody =>
      'Les mosquées autour de vous, avec les horaires de jamat et des comptes à rebours.';

  @override
  String get featureZakatTitle => 'Calculateur de zakat';

  @override
  String get featureZakatBody =>
      'Calculez la zakat dont vous êtes redevable, étape par étape.';

  @override
  String get featureCalendarTitle => 'Calendrier hégirien';

  @override
  String get featureCalendarBody =>
      'Dates hégiriennes et grégoriennes côte à côte.';

  @override
  String get featureWeatherTitle => 'Météo';

  @override
  String get featureWeatherBody =>
      'Les prévisions du jour sur l\'écran d\'accueil, à côté de vos prières.';

  @override
  String get featureWidgetTitle => 'Widget d\'écran d\'accueil';

  @override
  String get featureWidgetBody =>
      'Voyez la prochaine prière sans ouvrir l\'application.';

  @override
  String get featureThemesTitle => 'Thèmes et styles d\'icônes';

  @override
  String get featureThemesBody =>
      'Douze thèmes de couleur et quatre styles d\'icônes 3D, en clair et en sombre.';

  @override
  String get featureLanguagesTitle => 'Douze langues';

  @override
  String get featureLanguagesBody =>
      'Chiffres locaux et mise en page complète de droite à gauche.';

  @override
  String get readingTitle => 'Un texte arabe composé avec soin';

  @override
  String get readingBody =>
      'Le texte du Coran et des douas utilise des polices arabes dédiées, distinctes de celles de l\'interface.';

  @override
  String get readingAyahRef => 'Al-Fatiha 1:1';

  @override
  String get readingDuaRef => 'Al-Baqara 2:201';

  @override
  String get demoTitle => 'Voir les heures de prière du jour';

  @override
  String get demoSubtitle =>
      'Autorisez la localisation ou choisissez une ville pour voir les horaires du jour en direct.';

  @override
  String get demoUseLocation => 'Utiliser ma position';

  @override
  String get demoChooseCity => 'Choisir une ville';

  @override
  String get demoIdle => 'Vos cinq prières quotidiennes s\'afficheront ici.';

  @override
  String get demoLoading => 'Récupération des heures de prière…';

  @override
  String get demoErrorPermission =>
      'L\'accès à la position a été refusé. Choisissez plutôt une ville, ou autorisez la localisation dans les paramètres de votre navigateur.';

  @override
  String get demoErrorUnavailable =>
      'Impossible d\'obtenir votre position. Vérifiez que la localisation est activée, ou choisissez une ville.';

  @override
  String get demoErrorNetwork =>
      'Le service des heures de prière n\'a pas répondu. Vérifiez votre connexion et réessayez.';

  @override
  String get demoRetry => 'Réessayer';

  @override
  String get demoMyLocation => 'Votre position';

  @override
  String demoMethod(String method) {
    return 'Méthode : $method';
  }

  @override
  String demoTimezone(String zone) {
    return 'Fuseau horaire : $zone';
  }

  @override
  String get demoSource =>
      'Horaires fournis par l\'API Aladhan, à l\'heure locale du lieu.';

  @override
  String get cityMakkah => 'La Mecque';

  @override
  String get cityLondon => 'Londres';

  @override
  String get cityDhaka => 'Dacca';

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
  String get cityTehran => 'Téhéran';

  @override
  String get cityMogadishu => 'Mogadiscio';

  @override
  String get cityParis => 'Paris';

  @override
  String get cityMoscow => 'Moscou';

  @override
  String get themesTitle => 'Douze thèmes, clairs et sombres';

  @override
  String get themesSubtitle =>
      'Choisissez une palette et tout le site change avec elle, comme dans l\'application.';

  @override
  String get paletteViolet => 'Violet';

  @override
  String get paletteEmerald => 'Émeraude';

  @override
  String get paletteGreen => 'Vert';

  @override
  String get paletteRoseGold => 'Or rose';

  @override
  String get paletteDiSerria => 'Di Serria';

  @override
  String get paletteRose => 'Rose';

  @override
  String get palettePearl => 'Perle';

  @override
  String get paletteDeepPlum => 'Prune profonde';

  @override
  String get palettePink => 'Rose vif';

  @override
  String get palettePurple => 'Pourpre';

  @override
  String get paletteAurora => 'Aurore';

  @override
  String get paletteDusk => 'Crépuscule';

  @override
  String get defaultBadge => 'Par défaut';

  @override
  String get iconsTitle => 'Quatre styles d\'icônes';

  @override
  String get iconsSubtitle =>
      'Choisissez le jeu d\'icônes 3D qui vous plaît, ou laissez-le s\'accorder à votre thème.';

  @override
  String get iconStyleMatch => 'Assorti au thème';

  @override
  String iconStyleMatchCaption(String style) {
    return 'Actuellement : $style';
  }

  @override
  String get iconStyleClay => 'Argile brillante';

  @override
  String get iconStyleGoldEmerald => 'Or et émeraude';

  @override
  String get iconStyleFrostedGlass => 'Verre givré';

  @override
  String get iconStyleNightGlow => 'Lueur nocturne';

  @override
  String get languagesTitle => 'Parle votre langue';

  @override
  String get languagesSubtitle =>
      'Douze langues, avec une prise en charge complète de l\'écriture de droite à gauche pour l\'arabe, l\'ourdou et le persan.';

  @override
  String get rtlBadge => 'RTL';

  @override
  String get screenshotsTitle => 'De plus près';

  @override
  String get screenshotsSubtitle => 'Écrans de l\'application Android.';

  @override
  String get screenshotPrevious => 'Capture d\'écran précédente';

  @override
  String get screenshotNext => 'Capture d\'écran suivante';

  @override
  String get shotHome => 'Accueil';

  @override
  String get shotCompassStyles => 'Styles de boussole';

  @override
  String get shotMore => 'Toutes les fonctionnalités';

  @override
  String get faqTitle => 'Vos questions, nos réponses';

  @override
  String get faqCalculationQ =>
      'Comment les heures de prière sont-elles calculées ?';

  @override
  String get faqCalculationA =>
      'À partir de la position de votre appareil, selon des méthodes de calcul astronomique reconnues. Vous pouvez consulter les paramètres de calcul dans Paramètres de prière et d\'adhan, dans l\'application.';

  @override
  String get faqAdhanQ => 'Et si mon adhan ne sonne pas ?';

  @override
  String get faqAdhanA =>
      'Certains téléphones suspendent les alarmes pour économiser la batterie. Ouvrez Vérification des rappels dans l\'application pour vous assurer que rien ne bloque votre adhan et vos notifications.';

  @override
  String get faqQiblaQ => 'Comment obtenir une direction de qibla précise ?';

  @override
  String get faqQiblaA =>
      'Tenez votre téléphone à plat, loin du métal et des aimants. Si la précision baisse, déplacez le téléphone en formant un 8 pour recalibrer la boussole.';

  @override
  String get faqLanguagesQ => 'Quelles langues sont prises en charge ?';

  @override
  String get faqLanguagesA =>
      'Anglais, bengali, arabe, ourdou, hindi, indonésien, malais, turc, persan, somali, français et russe. L\'arabe, l\'ourdou et le persan utilisent une mise en page de droite à gauche.';

  @override
  String get faqLookQ => 'Puis-je changer l\'apparence de l\'application ?';

  @override
  String get faqLookA =>
      'Oui. Choisissez parmi douze thèmes de couleur, en clair ou en sombre, et quatre styles d\'icônes 3D, ou laissez les icônes s\'accorder à votre thème.';

  @override
  String get faqPlatformQ => 'Existe-t-il une version iPhone ?';

  @override
  String get faqPlatformA =>
      'Muslim Soul est une application Android. Sur ce site, vous pouvez essayer les heures de prière en direct et le localisateur de qibla dans votre navigateur.';

  @override
  String get downloadTitle => 'Apportez la sérénité à chaque heure de prière';

  @override
  String get downloadBody =>
      'Téléchargez Muslim Soul pour Android sur Google Play.';

  @override
  String get footerPrivacy => 'Confidentialité';

  @override
  String get footerTerms => 'Conditions';

  @override
  String get footerContact => 'Contact';

  @override
  String get footerGithub => 'GitHub';

  @override
  String get footerQibla => 'Localisateur de qibla';

  @override
  String footerCopyright(String year) {
    return '© $year Muslim Soul';
  }

  @override
  String get placeholderNotice =>
      'Texte provisoire. À remplacer avant publication.';

  @override
  String get privacyTitle => 'Politique de confidentialité';

  @override
  String get privacyP1 =>
      'Cette page explique quelles informations le site et l\'application Muslim Soul utilisent, et pourquoi.';

  @override
  String get privacyP2 =>
      'Si vous partagez votre position pour la démonstration des heures de prière, vos coordonnées sont envoyées à l\'API Aladhan pour calculer les horaires. Vos préférences, comme le thème et la langue, sont enregistrées dans votre propre navigateur.';

  @override
  String get privacyP3 =>
      'Des questions sur la confidentialité ? Contactez-nous via le lien en bas de cette page.';

  @override
  String get termsTitle => 'Conditions d\'utilisation';

  @override
  String get termsP1 =>
      'En utilisant le site ou l\'application Muslim Soul, vous acceptez ces conditions.';

  @override
  String get termsP2 =>
      'Les heures de prière, la direction de la qibla et les autres calculs sont fournis de bonne foi. Vérifiez auprès de votre mosquée locale lorsque la précision est importante.';

  @override
  String get termsP3 =>
      'Nous pouvons mettre à jour ces conditions de temps à autre. La dernière version figurera toujours sur cette page.';

  @override
  String get qiblaTitle => 'Localisateur de qibla';

  @override
  String get qiblaSubtitle =>
      'Saisissez des coordonnées pour trouver la direction de la Kaaba par rapport au nord géographique.';

  @override
  String get qiblaLatitude => 'Latitude';

  @override
  String get qiblaLongitude => 'Longitude';

  @override
  String get qiblaCalculate => 'Trouver la qibla';

  @override
  String qiblaResult(String degrees) {
    return '$degrees° depuis le nord géographique';
  }

  @override
  String qiblaDistance(String km) {
    return '$km km jusqu\'à la Kaaba';
  }

  @override
  String get qiblaHint =>
      'Faites face au nord géographique, puis tournez dans le sens des aiguilles d\'une montre de cet angle.';

  @override
  String get qiblaInvalid =>
      'Saisissez une latitude entre -90 et 90 et une longitude entre -180 et 180.';

  @override
  String get notFoundTitle => 'Page introuvable';

  @override
  String get notFoundBody => 'La page que vous cherchez n\'existe pas.';
}
