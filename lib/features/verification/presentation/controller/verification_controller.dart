import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/validator/validator.dart';
import 'package:flutter_triad/features/verification/domain/usecases/send_otp_usecase.dart';
import 'package:flutter_triad/features/verification/domain/usecases/verify_email_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';

class VerificationController extends GetxController {
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  SendOtpUseCase _sendOtpUseCase = instance<SendOtpUseCase>();
  VerifyEmailUseCase _verifyEmailUseCase = instance<VerifyEmailUseCase>();
  FieldValidator validator = FieldValidator();
  var formKey = GlobalKey<FormState>();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;

  void verifyEmail(BuildContext context) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();

    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );

    (await _verifyEmailUseCase.execute(
      VerifyEmailInput(
        email: email,
        otp: otp(),
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.error,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: ManagerStrings.verificationSuccess,
          title: ManagerStrings.thanks,
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
            Get.offAllNamed(Routes.login);
          });
    });
  }

  sendOtp({
    required BuildContext context,
    String? route,
  }) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );

    (await _sendOtpUseCase.execute(SendOtpInput(email: email))).fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.error,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: ManagerStrings.sendOtpSuccess,
          title: '',
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
            if (route.onNull() != '') {
              Get.offAllNamed(route!);
            }
          });
    });
  }

  otp() {
    return "${firstCodeTextController.text}${secondCodeTextController.text}${thirdCodeTextController.text}${fourthCodeTextController.text}${fifthCodeTextController.text}${sixthCodeTextController.text}";
  }

  @override
  void onInit() {
    super.onInit();
    firstCodeTextController = TextEditingController();
    secondCodeTextController = TextEditingController();
    thirdCodeTextController = TextEditingController();
    fourthCodeTextController = TextEditingController();
    fifthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    firstCodeTextController.dispose();
    secondCodeTextController.dispose();
    thirdCodeTextController.dispose();
    fourthCodeTextController.dispose();
    fifthCodeTextController.dispose();
    sixthFocusNode.dispose();

    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    formKey.currentState!.dispose();
  }
}
