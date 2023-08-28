import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/widgets/arrow_back_button.dart';
import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter_triad/core/widgets/text_field.dart';
import 'package:flutter_triad/features/forget_password/presentation/controller/forget_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/validator/validator.dart';

class ForgetPassView extends StatelessWidget {
  ForgetPassView({super.key});

  final FieldValidator _validator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ManagerHeight.h205,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ManagerRadius.r20),
                  bottomRight: Radius.circular(ManagerRadius.r20),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.symmetric(
                vertical: ManagerHeight.h44,
                horizontal: ManagerWidth.w20,
              ),
              child: arrowBackButton(),
            ),
            Padding(
              padding: EdgeInsets.only(top: ManagerHeight.h100),
              child: Container(
                width: double.infinity,
                height: ManagerHeight.h240,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w30, vertical: ManagerHeight.h30),
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r20),
                    color: ManagerColors.backgroundForm,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ]),
                child: GetBuilder<ForgetPasswordController>(
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Text(
                            ManagerStrings.forgetPassword,
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s20,
                                color: ManagerColors.primaryColor),
                          ),
                          SizedBox(
                            height: ManagerHeight.h8,
                          ),
                          Text(
                            ManagerStrings.forgetSubTitle,
                            textAlign: TextAlign.center,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            hintText: ManagerStrings.email,
                            controller: controller.email,
                            validator: (value) => _validator.validateEmail(
                              value,
                            ),
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          SizedBox(
                            height: ManagerHeight.h40,
                            child: mainButton(
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.forgetPassword(context);
                                  }
                                },
                                buttonName: ManagerStrings.confirm,
                                minWidth: double.infinity),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
