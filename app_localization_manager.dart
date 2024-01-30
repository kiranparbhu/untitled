import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import '../constants/app_constants.dart';
import '../preferences/preferences_manager.dart';

class AppLocalizationManager extends ChangeNotifier {
  final _preferenceManager = GetIt.I<PreferencesManager>();

  final _languageSubject = BehaviorSubject<bool>.seeded(true);

  static final AppLocalizationManager _instance = AppLocalizationManager._internal();

  AppLocalizationManager._internal();

  factory AppLocalizationManager() {
    return _instance;
  }

  static Locale _appLocale = const Locale(AppConstants.DEFAULT_LANGUAGE);

  static bool get isCurrentEnglish => _appLocale.languageCode == 'en';

  /// Get the current locale of the application.
  /// Will notify whenever language is changed.
  Stream<Locale> getAppLocale() {
    Stream<Locale> locale = _languageSubject
        .flatMap((_) => _preferenceManager.getLocaleString(PreferencesManager.keyLanguageCode))
        .map((locale) => Locale(locale));

    locale.listen((event) {
      _appLocale = event;
    });
    return locale;
  }

  /// Set the current locale of the application
  Stream<bool> setAppLocale(String languageCode) {
    _appLocale = Locale(languageCode);
    return _preferenceManager
        .setString(PreferencesManager.keyLanguageCode, languageCode)
        .doOnData((_) => _languageSubject.add(true));
  }

  /// Set the locale by the user of the application
  Stream<bool> setUserChooseAppLocale(String? languageCode) {
    return _preferenceManager
        .setString(AppConstants.KEY_USER_CHOOSE_LOCALE, languageCode!)
        .doOnData((_) => _languageSubject.add(true));
  }

  /// Get the choose user locale of the application.
  Stream<Locale?> getUserChooseAppLocale() {
    return _languageSubject
        .flatMap((_) => _preferenceManager.getString(AppConstants.KEY_USER_CHOOSE_LOCALE))
        .map((locale) => locale != null ? Locale(locale) : null);
  }
}