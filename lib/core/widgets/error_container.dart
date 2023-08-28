import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes_util.dart';
import '../resources/manager_styles.dart';

Container errorContainer(String message) {
  return Container(
    width: Constants.deviceWidth,
    height: Constants.deviceHeight,
    alignment: Alignment.center,
    padding: EdgeInsetsDirectional.only(
      bottom: ManagerHeight.h100,
    ),
    child: Text(
      message,
      style: getMediumTextStyle(
        fontSize: ManagerFontSize.s24,
        color: ManagerColors.grey,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
