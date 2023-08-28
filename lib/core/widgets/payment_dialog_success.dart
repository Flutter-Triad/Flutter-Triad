import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes_util.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_styles.dart';
import 'main_button.dart';

Future<dynamic> paymentDialogSuccess() {
  return showDialog(
    barrierDismissible: false,
    context: Get.context!,
    builder: (context) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w16,
          vertical: ManagerHeight.h215,
        ),
        padding: EdgeInsets.symmetric(
          vertical: ManagerHeight.h20,
          horizontal: ManagerWidth.w16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r8,
          ),
          color: ManagerColors.white,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              ManagerAssets.submitPayment,
              width: ManagerWidth.w48,
              height: ManagerHeight.h48,
            ),
            Spacer(),
            SizedBox(height: ManagerHeight.h6),
            Text(
              ManagerStrings.paymentSuccessful,
              style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20,
                color: ManagerColors.black,
              ),
            ),
            Spacer(),
            SizedBox(height: ManagerHeight.h6),
            Text(
              ManagerStrings.paymentRequest,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18,
                color: ManagerColors.greyLight,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ManagerHeight.h6),
            Spacer(flex: 2,),
            mainButton(
              minWidth: double.infinity,
              height: ManagerHeight.h44,
              onPressed: () => Get.offAllNamed(
                Routes.main,
              ),
              child: Text(
                ManagerStrings.confirm,
                style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.white,
                ),
              ),
              color: ManagerColors.primaryColor,
              padding: EdgeInsets.zero,
            ),
            Spacer(),
          ],
        ),
      );
    },
  );
}

