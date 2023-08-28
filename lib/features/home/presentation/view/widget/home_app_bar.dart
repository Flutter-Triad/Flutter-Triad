import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../routes/routes.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: ManagerColors.backgroundForm,
    title: Text(
      ManagerStrings.flutterTriad,
      style: getRegularTextStyle(
        fontSize: ManagerFontSize.s22,
        color: ManagerColors.primaryColor,
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(
            Routes.search,
          );
        },
        icon: SvgPicture.asset(
          ManagerAssets.search,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.toNamed(Routes.notifications);
        },
        icon: SvgPicture.asset(
          ManagerAssets.notification,
        ),
      )
    ],
  );
}
