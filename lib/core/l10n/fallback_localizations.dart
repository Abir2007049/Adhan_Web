import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// English framework strings (tooltips, date pickers) for site languages
/// Flutter itself doesn't ship, currently only Somali. Our own copy is still
/// localized through `AppLocalizations`.
///
/// List these after the `Global*` delegates; they only claim locales those
/// don't support.
const fallbackLocalizationsDelegates = <LocalizationsDelegate<Object>>[
  _Fallback<MaterialLocalizations>(
    GlobalMaterialLocalizations.delegate,
    DefaultMaterialLocalizations.load,
  ),
  _Fallback<CupertinoLocalizations>(
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.load,
  ),
  _Fallback<WidgetsLocalizations>(
    GlobalWidgetsLocalizations.delegate,
    DefaultWidgetsLocalizations.load,
  ),
];

class _Fallback<T> extends LocalizationsDelegate<T> {
  const _Fallback(this.global, this.loadDefault);

  final LocalizationsDelegate<T> global;
  final Future<T> Function(Locale) loadDefault;

  @override
  bool isSupported(Locale locale) => !global.isSupported(locale);

  @override
  Future<T> load(Locale locale) => loadDefault(locale);

  @override
  bool shouldReload(_Fallback<T> old) => false;

  @override
  Type get type => T;
}
