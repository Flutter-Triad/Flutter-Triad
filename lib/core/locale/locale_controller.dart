import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/dependency_injection.dart';

class LocaleController extends GetxController {
  Locale? locale;
  final AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    final appLocale = _appSettingsPrefs.getLocale().onNull();
    locale = _getLocaleFromString(appLocale);
  }

  Locale _getLocaleFromString(String appLocale) {
    switch (appLocale) {
      case 'ar':
        return const Locale('ar');
      case 'en':
        return const Locale('en');
      default:
        return Locale(Get.deviceLocale!.languageCode);
    }
  }
}
