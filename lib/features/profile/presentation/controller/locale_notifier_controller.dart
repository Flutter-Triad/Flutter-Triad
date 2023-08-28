import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/config/localization/locales.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleNotifierController extends GetxController {
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  final languagesList = LocaleSettings.languages;

  String get currentLanguage => _appSettingsPrefs.getLocale();

  Future<void> changeLanguage({required BuildContext context,required String languageCode}) async {
    this._appSettingsPrefs.setLocale(languageCode);
    EasyLocalization.of(context)!.setLocale(Locale(languageCode));
    Get.updateLocale(Locale(languageCode));
    update();
  }
}
