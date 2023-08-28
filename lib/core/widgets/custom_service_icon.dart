import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_sizes_util.dart';

Container customServiceIcon(
    {required String image, double? width, double? height}) {
  return Container(
    width: width ?? ManagerWidth.w32,
    height: height ?? ManagerHeight.h32,
    padding: EdgeInsets.symmetric(
      horizontal: ManagerWidth.w4,
      vertical: ManagerHeight.h4,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r10,
      ),
      color: ManagerColors.primaryColor.withOpacity(
        ManagerOpacity.Op_0_0_5,
      ),
    ),
    child: SvgPicture.asset(image),
  );
}
