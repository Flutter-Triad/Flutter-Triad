import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/features/notifications/domain/model/notification_model.dart';
import 'package:flutter_triad/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/widgets/error_container.dart';
import '../../../../core/widgets/shimmer/shimmer_list.dart';
import 'widget/notification.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        backgroundColor: ManagerColors.backgroundForm,
        title: Text(
          ManagerStrings.notifications,
          style: getRegularTextStyle(
            fontSize: ManagerFontSize.s18,
            color: ManagerColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return RefreshIndicator(
            child: controller.isLoading == 0
                ? ShimmerList()
                : controller.notifications.length > 0
                    ? ListView(
                        children: [
                          controller.isLoading == 1
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: ManagerWidth.w16,
                                    vertical: ManagerHeight.h10,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: controller.notifications.length,
                                    //controller.notifications.length,
                                    itemBuilder: (context, index) {
                                      NotificationModel notificationItem =
                                          controller.notifications[index];
                                      return notification(
                                        notificationItem.title.onNull(),
                                        notificationItem.body.onNull(),
                                        notificationItem.id.onNull(),
                                      );
                                    },
                                  ),
                                )
                              : errorContainer(controller.errorMessage)
                        ],
                      )
                    : Center(
                        child: Text(
                          ManagerStrings.thereAreNoNotificationsNow,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s26,
                            color: ManagerColors.black,
                          ),
                        ),
                      ),
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
            onRefresh: () async {
              controller.performRefresh();
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    disposeNotifications();
    super.dispose();
  }
}
