import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/cache/cache.dart';
import 'package:flutter_triad/features/auth/domain/usecase/register_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';

class RegisterController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RegisterUseCase _registerUseCase = instance<RegisterUseCase>();
  var formKey = GlobalKey<FormState>();
  bool check = false;
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  onChange(bool status) {
    check = status;
    update();
  }

  onChangeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  onChangeObscureConfirmPassword() {
    isObscureConfirmPassword = !isObscureConfirmPassword;
    update();
  }

  void performRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (!check) {
        dialogRender(
            context: context,
            message: ManagerStrings.shouldAgreeTerms,
            title: ManagerStrings.error,
            stateRenderType: StateRenderType.popUpErrorState,
            retryAction: () {
              Get.back();
            });
      } else {
        register(context);
      }
    }
  }

  void register(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: '',
        stateRenderType: StateRenderType.popUpLoadingState,
        retryAction: () {});
    (await _registerUseCase.execute(RegisterUseCaseInput(
            fullName: fullName.text,
            email: email.text,
            phone: phoneNumber.text,
            password: password.text,
            confirmPassword: confirmPassword.text)))
        .fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.registerFailed,
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {
        Get.back();
        dialogRender(
            context: context,
            message: ManagerStrings.registerSuccess,
            title: ManagerStrings.thanks,
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();
              Get.toNamed(Routes.verification);
            });
      },
    );
  }

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    formKey.currentState!.dispose();
    super.dispose();
  }
}
