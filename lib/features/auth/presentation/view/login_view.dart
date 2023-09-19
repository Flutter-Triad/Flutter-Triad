import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/validator/validator.dart';
import 'package:flutter_triad/core/widgets/checkbox_widget.dart';
import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter_triad/core/widgets/scaffold_with_background.dart';
import 'package:flutter_triad/core/widgets/text_field.dart';
import 'package:flutter_triad/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_icons.dart';
import '../widget/footer_auth.dart';
import '../widget/top_part_auth.dart';

class LoginView extends StatelessWidget {
  final FieldValidator _validator = FieldValidator();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffoldWithImageBackground(
        child: Column(
      children: [
        partTopAuth(),
        Expanded(
          flex: Constants.authSecondPartFlex,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w20,
              vertical: ManagerHeight.h4,
            ),
            decoration: BoxDecoration(
              color: ManagerColors.backgroundForm,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  ManagerRadius.r40,
                ),
              ),
            ),
            child: GetBuilder<LoginController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: ManagerHeight.h28,
                        ),
                        Text(
                          ManagerStrings.login,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s26,
                            color: ManagerColors.black,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h28,
                        ),
                        textField(
                          hintText: ManagerStrings.email,
                          controller: controller.email,
                          textInputType: TextInputType.emailAddress,
                          obSecure: false,
                          validator: (value) => _validator.validateEmail(
                            value,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h20,
                        ),
                        textField(
                          hintText: ManagerStrings.password,
                          textInputType: TextInputType.text,
                          obSecure: controller.isObscurePassword,
                          suffixIcon: IconButton(
                            icon: controller.isObscurePassword
                                ? Icon(
                                    ManagerIcons.visibility_off,
                                    color: ManagerColors.greyLight,
                                  )
                                : Icon(
                                    ManagerIcons.visibility,
                                    color: ManagerColors.primaryColor,
                                  ),
                            onPressed: () =>
                                controller.onChangeObscurePassword(),
                          ),
                          controller: controller.password,
                          validator: (value) => _validator.validatePassword(
                            value,
                          ),
                        ),
                        Container(
                          height: ManagerHeight.h38,
                          margin: EdgeInsets.symmetric(
                            vertical: ManagerHeight.h6,
                          ),
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              checkBoxWidget(
                                checkBoxName: ManagerStrings.rememberMe,
                                status: controller.check,
                                onChanged: (status) {
                                  controller.onChange(
                                    status!,
                                  );
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgetPassword);
                                },
                                child: Text(
                                  ManagerStrings.forgetPassword,
                                  style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    color: ManagerColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h90,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: ManagerHeight.h48,
                          child: mainButton(
                            onPressed: () {
                              controller.performLogin(context);
                            },
                            buttonName: ManagerStrings.login,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h16,
                        ),
                        FooterAuth(
                          text: ManagerStrings.footerLogin,
                          buttonName: ManagerStrings.signUp,
                          onPressed: () {
                            Get.offAllNamed(
                              Routes.register,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
