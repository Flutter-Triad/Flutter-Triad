import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/cache/cache.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:flutter_triad/features/auth/domain/usecase/login_usecase.dart';
import 'package:flutter_triad/features/verification/presentation/controller/verification_controller.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/widgets/cutom_state_render_dialog.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  final AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  var formKey = GlobalKey<FormState>();
  bool check = false;
  bool isObscurePassword = true;

  onChangeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  onChange(bool status) {
    check = status;
    update();
  }

  void performLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

  void login(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popUpLoadingState,
        retryAction: () {});

    (await _loginUseCase.execute(
            LoginUseCaseInput(email: email.text, password: password.text)))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.loginFailed,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () async {
          Get.back();
          if (l.code == ResponseCode.UNVERIFIED_USER) {
            await VerificationController().sendOtp(
              context: context,
              route: Routes.verification,
            );
          }
        },
      );
    }, (r) async {
      Get.back();
      customStateRenderDialog(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.loginSuccess,
        title: ManagerStrings.thanks,
        child: Container(),
      );
      Future.delayed(
        const Duration(seconds: 2),
            () {
          Get.offAllNamed(Routes.main);
        },
      );
      if (check) {
        _appSettingsPrefs.setEmail(email.text);
        _appSettingsPrefs.setToken(r.token.onNull());
        _appSettingsPrefs.setUserLoggedIn();
      } else {
        _appSettingsPrefs.setToken(r.token.onNull());
      }
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
