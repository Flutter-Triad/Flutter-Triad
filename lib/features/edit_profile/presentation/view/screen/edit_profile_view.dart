import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/validator/validator.dart';
import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter_triad/core/widgets/text_field.dart';
import 'package:flutter_triad/features/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:flutter_triad/features/profile/presentation/view/widget/custom_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final FieldValidator _validator = FieldValidator();

  EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ManagerColors.primaryColor,
        iconTheme: IconThemeData(
          color: ManagerColors.white,
          size: ManagerIconSize.s30,
        ),
        title: Text(
          ManagerStrings.editProfile,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s18, color: ManagerColors.white),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            CustomPhoto(
              visible: true,
            ),
            SizedBox(
              height: ManagerHeight.h100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
              child: textField(
                hintText: ManagerStrings.userName,
                onChange: (value) {
                  if (!controller.editNameChange) {
                    controller.editNameChange = true;
                  }
                },
                controller: controller.username,
                validator: (value) => _validator.validateFullName(value),
                textInputType: TextInputType.name,
                prefixIcon: Container(
                  width: ManagerWidth.w40,
                  height: ManagerHeight.h40,
                  padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w10,
                      vertical: ManagerHeight.h10),
                  decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  ),
                  child: Image.asset(
                    ManagerAssets.profile,
                    color: ManagerColors.textColorProfile,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: textField(
                hintText: ManagerStrings.email,
                controller: controller.email,
                validator: (value) => _validator.validateEmail(value),
                textInputType: TextInputType.emailAddress,
                prefixIcon: Container(
                  width: ManagerWidth.w40,
                  height: ManagerHeight.h40,
                  padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w10,
                      vertical: ManagerHeight.h10),
                  decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  ),
                  child: SvgPicture.asset(
                    ManagerAssets.email,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: textField(
                hintText: ManagerStrings.phone,
                controller: controller.phone,
                textInputType: TextInputType.phone,
                onChange: (value) {
                  if (!controller.editPhoneChange) {
                    controller.editPhoneChange = true;
                  }
                },
                prefixIcon: Container(
                  width: ManagerWidth.w40,
                  height: ManagerHeight.h40,
                  padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w10,
                      vertical: ManagerHeight.h10),
                  decoration: BoxDecoration(
                    color: ManagerColors.white,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  ),
                  child: SvgPicture.asset(
                    ManagerAssets.phone,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: mainButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.editNameChange) {
                        controller.editName(context);
                      }
                      if (controller.editPhoneChange) {
                        controller.editPhone(context);
                      }
                    }
                  },
                  buttonName: ManagerStrings.saveEdit),
            )
          ],
        ),
      ),
    );
  }
}
