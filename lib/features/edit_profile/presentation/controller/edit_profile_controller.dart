import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/features/edit_profile/data/request/edit_name_request.dart';
import 'package:flutter_triad/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/edit_name_usecase.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/edit_phone_usecase.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController dayOfBirth = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool editNameChange = false;
  bool editPhoneChange = false;
  EditNameUseCase editNameUseCase = instance<EditNameUseCase>();
  EditPhoneUseCase editPhoneUseCase = instance<EditPhoneUseCase>();
  ProfileUseCase profileUseCase = instance<ProfileUseCase>();

  void profile() async {
    BuildContext context = Get.context!;
    (await profileUseCase.execute()).fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.userProfileFailed,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      email.text = r.data.attributes.email!;
      username.text = r.data.attributes.name!;
      phone.text = r.data.attributes.phone!;
    });
  }

  void editName(BuildContext context) async {
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popUpLoadingState,
        retryAction: () {});
    (await editNameUseCase.execute(EditNameRequest(name: username.text))).fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.editNameFailed,
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
            message: ManagerStrings.editNameSuccess,
            title: ManagerStrings.thanks,
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();
            });
      },
    );
  }

  void editPhone(BuildContext context) async {
    Get.back();
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popUpLoadingState,
        retryAction: () {});
    (await editPhoneUseCase.execute(EditPhoneRequest(phone: phone.text))).fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.editPhoneFailed,
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
            message: ManagerStrings.editPhoneSuccess,
            title: ManagerStrings.thanks,
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();
            });
      },
    );
  }
  @override
  void onInit() {
    profile();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    username.dispose();
    dayOfBirth.dispose();
    phone.dispose();
    formKey.currentState!.dispose();

  }
}
