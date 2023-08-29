import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/features/notifications/domain/usecase/notifications_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../domain/model/notification_model.dart';

class NotificationsController extends GetxController {
  List<NotificationModel> notifications = [];
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;
  NetworkInfo networkInfo = instance<NetworkInfo>();

  NotificationsUseCase _useCase = instance<NotificationsUseCase>();

  performRefresh() async {
    if (await networkInfo.isConnected) {
      readNotifications();
    } else {
      BuildContext context = Get.context!;
      dialogRender(
        context: context,
        message: ManagerStrings.NO_INTERNT_CONNECTION,
        title: '',
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  void readNotifications() async {
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
          (l) {
        isLoading = 2;
        errorMessage = l.message.toString();
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Navigator.of(context).pop();
          },
        );
      },
          (r) {
        isLoading = 1;
        notifications = r.notifications!;
      },
    );
    update();
  }

  @override
  void onInit() {
    readNotifications();
    super.onInit();
  }
}
