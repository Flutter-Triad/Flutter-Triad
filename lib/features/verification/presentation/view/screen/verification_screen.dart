import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/config/localization/locales.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/widgets/arrow_back_button.dart';
import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter_triad/features/verification/presentation/controller/verification_controller.dart';
import 'package:flutter_triad/features/verification/presentation/view/widget/code_verification.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: localeSettings.defaultLocale.toString() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ManagerStrings.verificationCode,
            style: getMediumTextStyle(
              fontSize: ManagerFontSize.s18,
              color: ManagerColors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: arrowBackButton(
            color: ManagerColors.black,
            onPressed: () => Get.offAllNamed(
              Routes.login,
            ),
          ),
        ),
        backgroundColor: ManagerColors.white,
        body: GetBuilder<VerificationController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w20,
              vertical: ManagerHeight.h20,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Text(
                    ManagerStrings.subTitleVerification,
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w24,
                      vertical: ManagerHeight.h4,
                    ),
                    child: Text(
                      ManagerStrings.verifyMessage,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h30,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      child: Row(
                        children: [
                          CodeVerification(
                            controller: controller.firstCodeTextController,
                            focusNode: controller.firstFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.secondFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          CodeVerification(
                            controller: controller.secondCodeTextController,
                            focusNode: controller.secondFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.thirdFocusNode.requestFocus();
                              } else {
                                controller.firstFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          CodeVerification(
                            controller: controller.thirdCodeTextController,
                            focusNode: controller.thirdFocusNode,
                            previousFocusNode: controller.secondFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fourthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          CodeVerification(
                            controller: controller.fourthCodeTextController,
                            focusNode: controller.fourthFocusNode,
                            previousFocusNode: controller.thirdFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fifthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          CodeVerification(
                            controller: controller.fifthCodeTextController,
                            focusNode: controller.fifthFocusNode,
                            previousFocusNode: controller.fourthFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.sixthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          CodeVerification(
                            controller: controller.sixthCodeTextController,
                            focusNode: controller.sixthFocusNode,
                            previousFocusNode: controller.fifthFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.verifyEmail(context);
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ManagerStrings.resendCode,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      mainButton(
                        onPressed: () {
                          controller.sendOtp(context: context);
                        },
                        child: Text(
                          ManagerStrings.resend,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        height: ManagerHeight.h8,
                        padding: EdgeInsetsDirectional.only(
                          start: ManagerWidth.w2,
                        ),
                        color: ManagerColors.transparent,
                        elevation: Constants.elevation,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
