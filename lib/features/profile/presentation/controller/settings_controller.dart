import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:flutter_triad/features/profile/domain/usecase/balance_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';

class SettingsController extends GetxController {
  bool value = false;
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  void readBalance() async {
    BalanceUseCase _useCase = instance<BalanceUseCase>();
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
      (l) {
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Get.back();
            Get.back();
          },
        );
      },
      (r) {
        Get.back();
      },
    );
  }

  onChange(bool val) async {
    value = val;
    _appSettingsPrefs.setEnableNotifications(val);
    if (value) {
    } else {
    }
    update();
  }

  readInitNotificationStatus() {
    value = _appSettingsPrefs.getEnableNotifications();
  }

  @override
  void onInit() {
    // readBalance();
    super.onInit();
    readInitNotificationStatus();
  }
}
