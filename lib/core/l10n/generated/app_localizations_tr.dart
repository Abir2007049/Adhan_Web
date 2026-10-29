// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Muslim Soul';

  @override
  String get appTagline => 'Namaz vakitleri ve ezan, özenle.';

  @override
  String get navFeatures => 'Özellikler';

  @override
  String get navPrayerTimes => 'Namaz vakitleri';

  @override
  String get navThemes => 'Temalar';

  @override
  String get navLanguages => 'Diller';

  @override
  String get navFaq => 'SSS';

  @override
  String get getTheApp => 'Uygulamayı edinin';

  @override
  String get languageMenuLabel => 'Dil';

  @override
  String get themeModeLabel => 'Görünüm';

  @override
  String get themeModeSystem => 'Sistem';

  @override
  String get themeModeLight => 'Açık';

  @override
  String get themeModeDark => 'Koyu';

  @override
  String get openMenu => 'Menüyü aç';

  @override
  String get backToHome => 'Ana sayfaya dön';

  @override
  String get heroEyebrow => 'Namaz vakitleri · Ezan · Kıble';

  @override
  String get heroTitle => 'Nerede olursanız olun, her namazı vaktinde kılın';

  @override
  String get heroSubtitle =>
      'Konumunuza göre doğru namaz vakitleri, huzur veren bir ezan, kıble, Kur\'an ve günlük dualarınız; hepsi sakin ve güzel tek bir uygulamada.';

  @override
  String get heroTryDemo => 'Canlı namaz vakitlerini deneyin';

  @override
  String get playBadgeTop => 'ŞURADAN ALIN';

  @override
  String get storeLinkPending => 'Mağaza bağlantısı yakında';

  @override
  String get nextPrayer => 'Sonraki namaz';

  @override
  String startsIn(String time) {
    return '$time sonra başlıyor';
  }

  @override
  String get adhanOn => 'Ezan açık';

  @override
  String get prayerFajr => 'Sabah';

  @override
  String get prayerSunrise => 'Güneş';

  @override
  String get prayerDhuhr => 'Öğle';

  @override
  String get prayerAsr => 'İkindi';

  @override
  String get prayerMaghrib => 'Akşam';

  @override
  String get prayerIsha => 'Yatsı';

  @override
  String get featuresTitle =>
      'Namazla geçen gününüz için ihtiyacınız olan her şey';

  @override
  String get featuresSubtitle =>
      'Beş vakit namaz etrafında özenle tasarlanmış araçlar.';

  @override
  String get featurePrayerTimesTitle => 'Doğru namaz vakitleri';

  @override
  String get featurePrayerTimesBody =>
      'GPS konumunuza göre hesaplanır; sonraki namaz kartı ve büyük bir saatle.';

  @override
  String get featureAdhanTitle => 'Ezan ve hatırlatıcılar';

  @override
  String get featureAdhanBody =>
      'Her namaz vaktinde tam ezan alarmı ve kontrolünüzdeki bildirimler.';

  @override
  String get featureQiblaTitle => 'Kıble pusulası';

  @override
  String get featureQiblaBody =>
      'Nerede olursanız olun Kâbe\'nin yönünü bulun.';

  @override
  String get featureQuranTitle => 'Kur\'an okuyucu';

  @override
  String get featureQuranBody =>
      'Her sureyi okuyun, numara veya adla istediğiniz ayete gidin.';

  @override
  String get featureDuaTitle => 'Dualar ve zikirler';

  @override
  String get featureDuaBody => 'Günlük dualar ve zikirler, net Arapça yazıyla.';

  @override
  String get featureMosquesTitle => 'Yakındaki camiler';

  @override
  String get featureMosquesBody =>
      'Çevrenizdeki camiler, cemaat vakitleri ve geri sayımlarla.';

  @override
  String get featureZakatTitle => 'Zekât hesaplayıcı';

  @override
  String get featureZakatBody =>
      'Vermeniz gereken zekâtı adım adım hesaplayın.';

  @override
  String get featureCalendarTitle => 'Hicri takvim';

  @override
  String get featureCalendarBody => 'Hicri ve miladi tarihler yan yana.';

  @override
  String get featureWeatherTitle => 'Hava durumu';

  @override
  String get featureWeatherBody =>
      'Bugünün tahmini ana ekranda, namaz vakitlerinizin yanında.';

  @override
  String get featureWidgetTitle => 'Ana ekran widget\'ı';

  @override
  String get featureWidgetBody => 'Uygulamayı açmadan sonraki namazı görün.';

  @override
  String get featureThemesTitle => 'Temalar ve simge stilleri';

  @override
  String get featureThemesBody =>
      'Açık ve koyu modda on iki renk teması ve dört 3D simge stili.';

  @override
  String get featureLanguagesTitle => 'On iki dil';

  @override
  String get featureLanguagesBody => 'Yerel rakamlar ve tam sağdan sola düzen.';

  @override
  String get readingTitle => 'Özenle dizilmiş Arapça metin';

  @override
  String get readingBody =>
      'Kur\'an ve dua metinleri, arayüz yazı tiplerinden ayrı, özel Arapça yazı tipleriyle gösterilir.';

  @override
  String get readingAyahRef => 'Fâtiha 1:1';

  @override
  String get readingDuaRef => 'Bakara 2:201';

  @override
  String get demoTitle => 'Bugünün namaz vakitlerini görün';

  @override
  String get demoSubtitle =>
      'Konum izni verin veya bir şehir seçin, bugünün vakitlerini canlı görün.';

  @override
  String get demoUseLocation => 'Konumumu kullan';

  @override
  String get demoChooseCity => 'Şehir seçin';

  @override
  String get demoIdle => 'Beş vakit namazınız burada görünecek.';

  @override
  String get demoLoading => 'Namaz vakitleri alınıyor…';

  @override
  String get demoErrorPermission =>
      'Konum izni reddedildi. Bunun yerine bir şehir seçin veya tarayıcı ayarlarından konuma izin verin.';

  @override
  String get demoErrorUnavailable =>
      'Konumunuz alınamadı. Konumun açık olduğunu kontrol edin veya bir şehir seçin.';

  @override
  String get demoErrorNetwork =>
      'Namaz vakti hizmeti yanıt vermedi. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get demoRetry => 'Tekrar dene';

  @override
  String get demoMyLocation => 'Konumunuz';

  @override
  String demoMethod(String method) {
    return 'Yöntem: $method';
  }

  @override
  String demoTimezone(String zone) {
    return 'Saat dilimi: $zone';
  }

  @override
  String get demoSource =>
      'Vakitler Aladhan API\'den, konumun yerel saatine göre.';

  @override
  String get cityMakkah => 'Mekke';

  @override
  String get cityLondon => 'Londra';

  @override
  String get cityDhaka => 'Dakka';

  @override
  String get cityKarachi => 'Karaçi';

  @override
  String get cityNewDelhi => 'Yeni Delhi';

  @override
  String get cityJakarta => 'Cakarta';

  @override
  String get cityKualaLumpur => 'Kuala Lumpur';

  @override
  String get cityIstanbul => 'İstanbul';

  @override
  String get cityTehran => 'Tahran';

  @override
  String get cityMogadishu => 'Mogadişu';

  @override
  String get cityParis => 'Paris';

  @override
  String get cityMoscow => 'Moskova';

  @override
  String get themesTitle => 'On iki tema, açık ve koyu';

  @override
  String get themesSubtitle =>
      'Bir palet seçin, tüm site tıpkı uygulamadaki gibi onunla değişsin.';

  @override
  String get paletteViolet => 'Menekşe';

  @override
  String get paletteEmerald => 'Zümrüt';

  @override
  String get paletteGreen => 'Yeşil';

  @override
  String get paletteRoseGold => 'Gül Altını';

  @override
  String get paletteDiSerria => 'Di Serria';

  @override
  String get paletteRose => 'Gül';

  @override
  String get palettePearl => 'İnci';

  @override
  String get paletteDeepPlum => 'Koyu Erik';

  @override
  String get palettePink => 'Pembe';

  @override
  String get palettePurple => 'Mor';

  @override
  String get paletteAurora => 'Aurora';

  @override
  String get paletteDusk => 'Alacakaranlık';

  @override
  String get defaultBadge => 'Varsayılan';

  @override
  String get iconsTitle => 'Dört simge stili';

  @override
  String get iconsSubtitle =>
      'Sevdiğiniz 3D simge setini seçin ya da temanıza uymasını sağlayın.';

  @override
  String get iconStyleMatch => 'Temaya uy';

  @override
  String iconStyleMatchCaption(String style) {
    return 'Şu an: $style';
  }

  @override
  String get iconStyleClay => 'Parlak Kil';

  @override
  String get iconStyleGoldEmerald => 'Altın Zümrüt';

  @override
  String get iconStyleFrostedGlass => 'Buzlu Cam';

  @override
  String get iconStyleNightGlow => 'Gece Işıltısı';

  @override
  String get languagesTitle => 'Sizin dilinizi konuşur';

  @override
  String get languagesSubtitle =>
      'On iki dil; Arapça, Urduca ve Farsça için tam sağdan sola desteğiyle.';

  @override
  String get rtlBadge => 'RTL';

  @override
  String get screenshotsTitle => 'Daha yakından bakın';

  @override
  String get screenshotsSubtitle => 'Android uygulamasından ekranlar.';

  @override
  String get screenshotPrevious => 'Önceki ekran görüntüsü';

  @override
  String get screenshotNext => 'Sonraki ekran görüntüsü';

  @override
  String get shotHome => 'Ana sayfa';

  @override
  String get shotCompassStyles => 'Pusula stilleri';

  @override
  String get shotMore => 'Tüm özellikler';

  @override
  String get faqTitle => 'Sorular ve cevaplar';

  @override
  String get faqCalculationQ => 'Namaz vakitleri nasıl hesaplanıyor?';

  @override
  String get faqCalculationA =>
      'Cihazınızın konumundan, yerleşik astronomik hesaplama yöntemleriyle. Hesaplama ayarlarını uygulamadaki Namaz ve ezan ayarları bölümünden inceleyebilirsiniz.';

  @override
  String get faqAdhanQ => 'Ezanım okunmazsa ne yapmalıyım?';

  @override
  String get faqAdhanA =>
      'Bazı telefonlar pil tasarrufu için alarmları durdurur. Ezanınızı ve bildirimlerinizi hiçbir şeyin engellemediğinden emin olmak için uygulamada Hatırlatıcı kontrolünü açın.';

  @override
  String get faqQiblaQ => 'Doğru kıble yönünü nasıl bulurum?';

  @override
  String get faqQiblaA =>
      'Telefonunuzu düz tutun, metal ve mıknatıslardan uzak durun. Doğruluk düşerse pusulayı yeniden ayarlamak için telefonu 8 şeklinde hareket ettirin.';

  @override
  String get faqLanguagesQ => 'Hangi diller destekleniyor?';

  @override
  String get faqLanguagesA =>
      'İngilizce, Bengalce, Arapça, Urduca, Hintçe, Endonezce, Malayca, Türkçe, Farsça, Somalice, Fransızca ve Rusça. Arapça, Urduca ve Farsça sağdan sola düzen kullanır.';

  @override
  String get faqLookQ => 'Uygulamanın görünümünü değiştirebilir miyim?';

  @override
  String get faqLookA =>
      'Evet. Açık veya koyu modda on iki renk teması ve dört 3D simge stili arasından seçim yapın ya da simgelerin temanıza uymasını sağlayın.';

  @override
  String get faqPlatformQ => 'iPhone sürümü var mı?';

  @override
  String get faqPlatformA =>
      'Muslim Soul bir Android uygulamasıdır. Bu web sitesinde canlı namaz vakitlerini ve kıble bulucuyu tarayıcınızda deneyebilirsiniz.';

  @override
  String get downloadTitle => 'Her namaz vaktine huzur katın';

  @override
  String get downloadBody =>
      'Android için Muslim Soul\'u Google Play\'den edinin.';

  @override
  String get footerPrivacy => 'Gizlilik';

  @override
  String get footerTerms => 'Koşullar';

  @override
  String get footerContact => 'İletişim';

  @override
  String get footerGithub => 'GitHub';

  @override
  String get footerQibla => 'Kıble bulucu';

  @override
  String footerCopyright(String year) {
    return '© $year Muslim Soul';
  }

  @override
  String get placeholderNotice => 'Geçici metin. Yayınlamadan önce değiştirin.';

  @override
  String get privacyTitle => 'Gizlilik politikası';

  @override
  String get privacyP1 =>
      'Bu sayfa, Muslim Soul web sitesinin ve uygulamasının hangi bilgileri neden kullandığını açıklar.';

  @override
  String get privacyP2 =>
      'Namaz vakitleri demosu için konumunuzu paylaşırsanız, vakitleri hesaplamak üzere koordinatlarınız Aladhan API\'ye gönderilir. Tema ve dil gibi ayarlarınız kendi tarayıcınızda saklanır.';

  @override
  String get privacyP3 =>
      'Gizlilikle ilgili sorularınız mı var? Bu sayfanın altındaki bağlantıdan bize ulaşın.';

  @override
  String get termsTitle => 'Kullanım koşulları';

  @override
  String get termsP1 =>
      'Muslim Soul web sitesini veya uygulamasını kullanarak bu koşulları kabul etmiş olursunuz.';

  @override
  String get termsP2 =>
      'Namaz vakitleri, kıble yönü ve diğer hesaplamalar iyi niyetle sunulur. Doğruluğun önemli olduğu durumlarda lütfen yerel camiinizle teyit edin.';

  @override
  String get termsP3 =>
      'Bu koşulları zaman zaman güncelleyebiliriz. En güncel sürüm her zaman bu sayfada olacaktır.';

  @override
  String get qiblaTitle => 'Kıble bulucu';

  @override
  String get qiblaSubtitle =>
      'Gerçek kuzeyden Kâbe\'nin yönünü bulmak için koordinatları girin.';

  @override
  String get qiblaLatitude => 'Enlem';

  @override
  String get qiblaLongitude => 'Boylam';

  @override
  String get qiblaCalculate => 'Kıbleyi bul';

  @override
  String qiblaResult(String degrees) {
    return 'Gerçek kuzeyden $degrees°';
  }

  @override
  String qiblaDistance(String km) {
    return 'Kâbe\'ye $km km';
  }

  @override
  String get qiblaHint =>
      'Gerçek kuzeye dönün, ardından saat yönünde bu açı kadar dönün.';

  @override
  String get qiblaInvalid =>
      '-90 ile 90 arasında bir enlem ve -180 ile 180 arasında bir boylam girin.';

  @override
  String get notFoundTitle => 'Sayfa bulunamadı';

  @override
  String get notFoundBody => 'Aradığınız sayfa mevcut değil.';
}
