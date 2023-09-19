import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';

class SplashController extends GetxController {
  final AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  BuildContext context = Get.context!;

  @override
  void onInit() {
    super.onInit();
    // _appSettingsPrefs.clear();
    Future.delayed(
      const Duration(
        seconds: Constants.splashTimeSecond,
      ),
      () {
        if (_appSettingsPrefs.getUserLoggedIn()) {
          Get.offAllNamed(
            Routes.main,
          );
        } else {
          if (_appSettingsPrefs.getOutBoardingScreenViewed()) {
            Get.offAllNamed(
              Routes.login,
            );
          } else {
            _appSettingsPrefs.setLocale(context.locale.languageCode);
            Get.offAllNamed(
              Routes.outBoarding,
            );
          }
        }
      },
    );
  }
}
