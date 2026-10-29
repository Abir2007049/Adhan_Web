import 'package:web/web.dart' as web;

import 'app_language.dart';

void syncDocumentLanguage(AppLanguage language) {
  web.document.documentElement
    ?..setAttribute('lang', language.code)
    ..setAttribute('dir', language.isRtl ? 'rtl' : 'ltr');
}
