import 'package:flutter_triad/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_icons.dart';
import '../resources/manager_sizes_util.dart';
import '../service/icon_service.dart';
import 'main_button.dart';

Widget arrowBackButton({Color? color, void Function()? onPressed}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      top: ManagerHeight.h12,
    ),
    child: mainButton(
      onPressed: onPressed ?? () {
        Get.offAllNamed(Routes.login);
      },
      child: IconService().getIcon(
        icon: ManagerIcons.arrow_back_ios,
        color: color ?? ManagerColors.white,
        iconSize: ManagerIconSize.s24,
      ),
      color: ManagerColors.transparent,
      elevation: Constants.arrowBackButtonElevation,
    ),
  );
}
