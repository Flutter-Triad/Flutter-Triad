import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/features/profile/presentation/controller/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h100,
      margin: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h10,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.backgroundForm,
        borderRadius: BorderRadius.circular(
          ManagerRadius.r16,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ManagerColors.greyLight,
            offset: Offset(0.0, 2.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10,
                vertical: ManagerHeight.h10,
              ),
              child: Text(
                ManagerStrings.notifications,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(
                left: ManagerWidth.w14,
                right: ManagerWidth.w14,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ManagerAssets.notification2,
                  ),
                  SizedBox(
                    width: ManagerWidth.w10,
                  ),
                  Text(
                    ManagerStrings.notifications,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textColorProfile),
                  ),
                  Spacer(),
                  GetBuilder<SettingsController>(builder: (controller) {
                    return Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: controller.value,
                        onChanged: (val) {
                          controller.onChange(val);
                        },
                        activeColor: ManagerColors.activeSwitchColor,
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
