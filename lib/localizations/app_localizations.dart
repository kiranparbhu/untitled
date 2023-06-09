import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AppLocalizations {
  static final supportedLanguages = [
    const Locale('en', ''), // English
    const Locale('gu', ''), // Gujarati
  ];

  /// Default language of the app.
  static const DEFAULT_LANGUAGE = 'en';

  /// Convenient static variable to access delegate
  static LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<dynamic, dynamic>? _localisedValues;

  AppLocalizations(Locale locale) {
    _loadResources(locale);
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture(AppLocalizations(locale));
  }

  String translate(String key) {
    return _localisedValues != null ? (_localisedValues![key] ?? "$key not found") : '';
  }

  /// Load all the localization for the current language
  void _loadResources(Locale locale) async {
    await _checkExternalDirectory(locale);
    if (_localisedValues == null) {
     // debugPrint("load _loadResources ==== ");
      String jsonContent = await rootBundle.loadString("assets/localizations/en.json");
      debugPrint("load _loadResources ==== $jsonContent");
      _localisedValues = json.decode(jsonContent);
    }
  }

  Future<bool> _checkExternalDirectory(Locale locale) async {
    final mainDirectory = await getApplicationSupportDirectory();
    final file = File('${mainDirectory.path}/localizations/${locale.languageCode}.json');
    debugPrint("_checkExternalDirectory ===$file");
    if (file.existsSync()) debugPrint("file =existsSync==$file");
    try {
      _localisedValues = json.decode(file.readAsStringSync());
      debugPrint("file =_localisedValues==$_localisedValues");
    } catch (error) {
      debugPrint('error $error');
    }

    return true;
  }
}

/// Delegate for loading resources for given locale.
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    Locale supportedLocale = AppLocalizations.supportedLanguages
        .firstWhere((supportedLocale) => supportedLocale.languageCode.toLowerCase() == locale.languageCode.toLowerCase());
    debugPrint("_AppLocalizationsDelegate supportedLocale ==== $supportedLocale");
    return true;
    // return supportedLocale != null;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return false;
  }
}