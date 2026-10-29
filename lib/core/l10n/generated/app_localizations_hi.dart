// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Muslim Soul';

  @override
  String get appTagline => 'नमाज़ के समय और अज़ान, ख़ूबसूरती से।';

  @override
  String get navFeatures => 'सुविधाएँ';

  @override
  String get navPrayerTimes => 'नमाज़ के समय';

  @override
  String get navThemes => 'थीम';

  @override
  String get navLanguages => 'भाषाएँ';

  @override
  String get navFaq => 'सवाल-जवाब';

  @override
  String get getTheApp => 'ऐप पाएँ';

  @override
  String get languageMenuLabel => 'भाषा';

  @override
  String get themeModeLabel => 'रूप';

  @override
  String get themeModeSystem => 'सिस्टम';

  @override
  String get themeModeLight => 'लाइट';

  @override
  String get themeModeDark => 'डार्क';

  @override
  String get openMenu => 'मेनू खोलें';

  @override
  String get backToHome => 'होम पर वापस जाएँ';

  @override
  String get heroEyebrow => 'नमाज़ के समय · अज़ान · क़िबला';

  @override
  String get heroTitle => 'हर नमाज़ निभाएँ, आप जहाँ भी हों';

  @override
  String get heroSubtitle =>
      'आपकी लोकेशन के लिए सटीक नमाज़ के समय, मधुर अज़ान, क़िबला, क़ुरआन और रोज़ की दुआएँ, एक शांत और सुंदर ऐप में।';

  @override
  String get heroTryDemo => 'लाइव नमाज़ के समय देखें';

  @override
  String get playBadgeTop => 'यहाँ पाएँ';

  @override
  String get storeLinkPending => 'स्टोर लिंक जल्द आ रहा है';

  @override
  String get nextPrayer => 'अगली नमाज़';

  @override
  String startsIn(String time) {
    return 'शुरू होने में $time';
  }

  @override
  String get adhanOn => 'अज़ान चालू';

  @override
  String get prayerFajr => 'फ़ज्र';

  @override
  String get prayerSunrise => 'सूर्योदय';

  @override
  String get prayerDhuhr => 'ज़ुहर';

  @override
  String get prayerAsr => 'अस्र';

  @override
  String get prayerMaghrib => 'मग़रिब';

  @override
  String get prayerIsha => 'इशा';

  @override
  String get featuresTitle => 'नमाज़ के दिन के लिए सब कुछ';

  @override
  String get featuresSubtitle =>
      'पाँच वक़्त की नमाज़ के इर्द-गिर्द सोच-समझकर बनाए गए टूल।';

  @override
  String get featurePrayerTimesTitle => 'सटीक नमाज़ के समय';

  @override
  String get featurePrayerTimesBody =>
      'आपकी GPS लोकेशन के लिए गणना, अगली नमाज़ के कार्ड और बड़ी घड़ी के साथ।';

  @override
  String get featureAdhanTitle => 'अज़ान और रिमाइंडर';

  @override
  String get featureAdhanBody =>
      'हर नमाज़ के समय पूरी अज़ान का अलार्म, और आपके नियंत्रण में नोटिफ़िकेशन।';

  @override
  String get featureQiblaTitle => 'क़िबला कंपास';

  @override
  String get featureQiblaBody => 'आप जहाँ भी हों, काबा की दिशा जानें।';

  @override
  String get featureQuranTitle => 'क़ुरआन रीडर';

  @override
  String get featureQuranBody =>
      'हर सूरह पढ़ें और नंबर या नाम से किसी भी आयत पर जाएँ।';

  @override
  String get featureDuaTitle => 'दुआएँ और अज़कार';

  @override
  String get featureDuaBody => 'रोज़ की दुआएँ और ज़िक्र, साफ़ अरबी लिपि में।';

  @override
  String get featureMosquesTitle => 'आस-पास की मस्जिदें';

  @override
  String get featureMosquesBody =>
      'आपके आस-पास की मस्जिदें, जमात के समय और काउंटडाउन के साथ।';

  @override
  String get featureZakatTitle => 'ज़कात कैलकुलेटर';

  @override
  String get featureZakatBody => 'क़दम-ब-क़दम अपनी ज़कात का हिसाब लगाएँ।';

  @override
  String get featureCalendarTitle => 'हिजरी कैलेंडर';

  @override
  String get featureCalendarBody => 'हिजरी और ग्रेगोरियन तारीख़ें साथ-साथ।';

  @override
  String get featureWeatherTitle => 'मौसम';

  @override
  String get featureWeatherBody =>
      'होम स्क्रीन पर आज का पूर्वानुमान, आपकी नमाज़ों के साथ।';

  @override
  String get featureWidgetTitle => 'होम-स्क्रीन विजेट';

  @override
  String get featureWidgetBody => 'ऐप खोले बिना अगली नमाज़ देखें।';

  @override
  String get featureThemesTitle => 'थीम और आइकन स्टाइल';

  @override
  String get featureThemesBody =>
      'लाइट और डार्क में बारह रंग थीम और चार 3D आइकन स्टाइल।';

  @override
  String get featureLanguagesTitle => 'बारह भाषाएँ';

  @override
  String get featureLanguagesBody => 'स्थानीय अंक और पूरा दाएँ-से-बाएँ लेआउट।';

  @override
  String get readingTitle => 'ध्यान से सजाया गया अरबी पाठ';

  @override
  String get readingBody =>
      'क़ुरआन और दुआ के पाठ के लिए ख़ास अरबी फ़ॉन्ट इस्तेमाल होते हैं, जो इंटरफ़ेस के फ़ॉन्ट से अलग हैं।';

  @override
  String get readingAyahRef => 'अल-फ़ातिहा १:१';

  @override
  String get readingDuaRef => 'अल-बक़रा २:२०१';

  @override
  String get demoTitle => 'आज के नमाज़ के समय देखें';

  @override
  String get demoSubtitle =>
      'लोकेशन की अनुमति दें या कोई शहर चुनें और आज के समय लाइव देखें।';

  @override
  String get demoUseLocation => 'मेरी लोकेशन इस्तेमाल करें';

  @override
  String get demoChooseCity => 'शहर चुनें';

  @override
  String get demoIdle => 'आपकी पाँचों नमाज़ें यहाँ दिखेंगी।';

  @override
  String get demoLoading => 'नमाज़ के समय लाए जा रहे हैं…';

  @override
  String get demoErrorPermission =>
      'लोकेशन की अनुमति नहीं मिली। इसके बजाय कोई शहर चुनें, या ब्राउज़र सेटिंग्स में लोकेशन की अनुमति दें।';

  @override
  String get demoErrorUnavailable =>
      'आपकी लोकेशन नहीं मिल सकी। देखें कि लोकेशन चालू है, या कोई शहर चुनें।';

  @override
  String get demoErrorNetwork =>
      'नमाज़ के समय की सेवा ने जवाब नहीं दिया। अपना कनेक्शन जाँचें और फिर कोशिश करें।';

  @override
  String get demoRetry => 'फिर कोशिश करें';

  @override
  String get demoMyLocation => 'आपकी लोकेशन';

  @override
  String demoMethod(String method) {
    return 'तरीक़ा: $method';
  }

  @override
  String demoTimezone(String zone) {
    return 'टाइम ज़ोन: $zone';
  }

  @override
  String get demoSource => 'समय Aladhan API से, उस जगह के स्थानीय समय में।';

  @override
  String get cityMakkah => 'मक्का';

  @override
  String get cityLondon => 'लंदन';

  @override
  String get cityDhaka => 'ढाका';

  @override
  String get cityKarachi => 'कराची';

  @override
  String get cityNewDelhi => 'नई दिल्ली';

  @override
  String get cityJakarta => 'जकार्ता';

  @override
  String get cityKualaLumpur => 'कुआलालंपुर';

  @override
  String get cityIstanbul => 'इस्तांबुल';

  @override
  String get cityTehran => 'तेहरान';

  @override
  String get cityMogadishu => 'मोगादिशु';

  @override
  String get cityParis => 'पेरिस';

  @override
  String get cityMoscow => 'मॉस्को';

  @override
  String get themesTitle => 'बारह थीम, लाइट और डार्क';

  @override
  String get themesSubtitle =>
      'कोई पैलेट चुनें और पूरी साइट उसके साथ बदल जाएगी, बिल्कुल ऐप की तरह।';

  @override
  String get paletteViolet => 'वायलेट';

  @override
  String get paletteEmerald => 'एमरल्ड';

  @override
  String get paletteGreen => 'हरा';

  @override
  String get paletteRoseGold => 'रोज़ गोल्ड';

  @override
  String get paletteDiSerria => 'डी सेरिया';

  @override
  String get paletteRose => 'रोज़';

  @override
  String get palettePearl => 'पर्ल';

  @override
  String get paletteDeepPlum => 'डीप प्लम';

  @override
  String get palettePink => 'गुलाबी';

  @override
  String get palettePurple => 'बैंगनी';

  @override
  String get paletteAurora => 'ऑरोरा';

  @override
  String get paletteDusk => 'संध्या';

  @override
  String get defaultBadge => 'डिफ़ॉल्ट';

  @override
  String get iconsTitle => 'चार आइकन स्टाइल';

  @override
  String get iconsSubtitle =>
      'अपनी पसंद का 3D आइकन सेट चुनें, या उसे अपनी थीम से मेल खाने दें।';

  @override
  String get iconStyleMatch => 'थीम से मेल';

  @override
  String iconStyleMatchCaption(String style) {
    return 'अभी: $style';
  }

  @override
  String get iconStyleClay => 'ग्लॉसी क्ले';

  @override
  String get iconStyleGoldEmerald => 'गोल्ड एमरल्ड';

  @override
  String get iconStyleFrostedGlass => 'फ़्रॉस्टेड ग्लास';

  @override
  String get iconStyleNightGlow => 'नाइट ग्लो';

  @override
  String get languagesTitle => 'आपकी भाषा में';

  @override
  String get languagesSubtitle =>
      'बारह भाषाएँ, अरबी, उर्दू और फ़ारसी के लिए पूरे दाएँ-से-बाएँ सपोर्ट के साथ।';

  @override
  String get rtlBadge => 'RTL';

  @override
  String get screenshotsTitle => 'क़रीब से देखें';

  @override
  String get screenshotsSubtitle => 'एंड्रॉइड ऐप की स्क्रीन।';

  @override
  String get screenshotPrevious => 'पिछला स्क्रीनशॉट';

  @override
  String get screenshotNext => 'अगला स्क्रीनशॉट';

  @override
  String get shotHome => 'होम';

  @override
  String get shotCompassStyles => 'कंपास स्टाइल';

  @override
  String get shotMore => 'सभी सुविधाएँ';

  @override
  String get faqTitle => 'सवालों के जवाब';

  @override
  String get faqCalculationQ => 'नमाज़ के समय की गणना कैसे होती है?';

  @override
  String get faqCalculationA =>
      'आपके डिवाइस की लोकेशन से, मान्य खगोलीय गणना पद्धतियों के ज़रिए। ऐप में नमाज़ और अज़ान सेटिंग्स में गणना की सेटिंग देख सकते हैं।';

  @override
  String get faqAdhanQ => 'अगर मेरी अज़ान न बजे तो?';

  @override
  String get faqAdhanA =>
      'कुछ फ़ोन बैटरी बचाने के लिए अलार्म रोक देते हैं। ऐप में रिमाइंडर चेक-अप खोलें ताकि पक्का हो कि कुछ भी आपकी अज़ान और नोटिफ़िकेशन को नहीं रोक रहा।';

  @override
  String get faqQiblaQ => 'सटीक क़िबला दिशा कैसे पाएँ?';

  @override
  String get faqQiblaA =>
      'फ़ोन को सपाट रखें, धातु और चुंबक से दूर। अगर सटीकता घटे, तो कंपास कैलिब्रेट करने के लिए फ़ोन को ८ के आकार में घुमाएँ।';

  @override
  String get faqLanguagesQ => 'कौन-सी भाषाएँ उपलब्ध हैं?';

  @override
  String get faqLanguagesA =>
      'अंग्रेज़ी, बांग्ला, अरबी, उर्दू, हिंदी, इंडोनेशियाई, मलय, तुर्की, फ़ारसी, सोमाली, फ़्रेंच और रूसी। अरबी, उर्दू और फ़ारसी दाएँ-से-बाएँ लेआउट का इस्तेमाल करती हैं।';

  @override
  String get faqLookQ => 'क्या मैं ऐप का रूप बदल सकता हूँ?';

  @override
  String get faqLookA =>
      'हाँ। लाइट या डार्क में बारह रंग थीम और चार 3D आइकन स्टाइल में से चुनें, या आइकन को अपनी थीम से मेल खाने दें।';

  @override
  String get faqPlatformQ => 'क्या iPhone वर्ज़न है?';

  @override
  String get faqPlatformA =>
      'Muslim Soul एक एंड्रॉइड ऐप है। इस वेबसाइट पर आप अपने ब्राउज़र में लाइव नमाज़ के समय और क़िबला फ़ाइंडर आज़मा सकते हैं।';

  @override
  String get downloadTitle => 'हर नमाज़ के समय में सुकून लाएँ';

  @override
  String get downloadBody => 'Google Play से एंड्रॉइड के लिए Muslim Soul पाएँ।';

  @override
  String get footerPrivacy => 'गोपनीयता';

  @override
  String get footerTerms => 'शर्तें';

  @override
  String get footerContact => 'संपर्क';

  @override
  String get footerGithub => 'GitHub';

  @override
  String get footerQibla => 'क़िबला फ़ाइंडर';

  @override
  String footerCopyright(String year) {
    return '© $year Muslim Soul';
  }

  @override
  String get placeholderNotice => 'अस्थायी पाठ। प्रकाशित करने से पहले बदलें।';

  @override
  String get privacyTitle => 'गोपनीयता नीति';

  @override
  String get privacyP1 =>
      'यह पेज बताता है कि Muslim Soul वेबसाइट और ऐप कौन-सी जानकारी इस्तेमाल करते हैं, और क्यों।';

  @override
  String get privacyP2 =>
      'अगर आप नमाज़ के समय के डेमो के लिए अपनी लोकेशन साझा करते हैं, तो समय की गणना के लिए आपके निर्देशांक Aladhan API को भेजे जाते हैं। थीम और भाषा जैसी आपकी सेटिंग्स आपके अपने ब्राउज़र में सहेजी जाती हैं।';

  @override
  String get privacyP3 =>
      'गोपनीयता के बारे में सवाल हैं? इस पेज के नीचे दिए लिंक से हमसे संपर्क करें।';

  @override
  String get termsTitle => 'उपयोग की शर्तें';

  @override
  String get termsP1 =>
      'Muslim Soul वेबसाइट या ऐप का इस्तेमाल करके आप इन शर्तों से सहमत होते हैं।';

  @override
  String get termsP2 =>
      'नमाज़ के समय, क़िबला दिशा और अन्य गणनाएँ नेकनीयती से दी जाती हैं। जहाँ सटीकता ज़रूरी हो, अपनी स्थानीय मस्जिद से पुष्टि कर लें।';

  @override
  String get termsP3 =>
      'हम समय-समय पर इन शर्तों को अपडेट कर सकते हैं। नवीनतम संस्करण हमेशा इसी पेज पर होगा।';

  @override
  String get qiblaTitle => 'क़िबला फ़ाइंडर';

  @override
  String get qiblaSubtitle =>
      'वास्तविक उत्तर से काबा की दिशा जानने के लिए निर्देशांक दर्ज करें।';

  @override
  String get qiblaLatitude => 'अक्षांश';

  @override
  String get qiblaLongitude => 'देशांतर';

  @override
  String get qiblaCalculate => 'क़िबला खोजें';

  @override
  String qiblaResult(String degrees) {
    return 'वास्तविक उत्तर से $degrees°';
  }

  @override
  String qiblaDistance(String km) {
    return 'काबा तक $km किमी';
  }

  @override
  String get qiblaHint =>
      'वास्तविक उत्तर की ओर मुँह करें, फिर इस कोण से घड़ी की दिशा में मुड़ें।';

  @override
  String get qiblaInvalid =>
      '-९० से ९० के बीच अक्षांश और -१८० से १८० के बीच देशांतर दर्ज करें।';

  @override
  String get notFoundTitle => 'पेज नहीं मिला';

  @override
  String get notFoundBody => 'आप जो पेज ढूँढ रहे हैं वह मौजूद नहीं है।';
}
