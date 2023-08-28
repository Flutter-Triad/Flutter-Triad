import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

Widget checkBoxWidget({
  required String checkBoxName,
  required bool status,
  void Function(bool?)? onChanged,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: ManagerWidth.w18,
          height: ManagerHeight.h18,
          margin: EdgeInsetsDirectional.only(
            end: ManagerWidth.w6,
          ),
          child: Checkbox(
            value: status,
            onChanged: onChanged,
            activeColor: ManagerColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ManagerRadius.r4,
              ),
            ),
            side: BorderSide(
              width: ManagerWidth.w1,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChanged?.call(!status); // Toggle the checked status
          },
          child: Text(
            checkBoxName,
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s11,
              color: ManagerColors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

