import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile_controller.dart';
import '../widget/custom_photo.dart';
import '../widget/custom_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ManagerColors.primaryColor,
          title: Text(
            ManagerStrings.profile,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.white),
          ),
        ),
        body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return ListView(
              children: [
                const CustomPhoto(visible: false),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ManagerColors.backgroundForm,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    boxShadow: const [
                      BoxShadow(
                        color: ManagerColors.greyLight,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h16),
                  child: Column(
                    children: [
                      CustomProfile(
                        imagePath: ManagerAssets.userProfile,
                        textName: ManagerStrings.editProfile,
                        onTap: () => Get.toNamed(Routes.editProfile),
                      ),
                      const Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.setting,
                        textName: ManagerStrings.setting,
                        onTap: () => Get.toNamed(Routes.setting),
                      ),
                      const Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.send,
                          textName: ManagerStrings.share,
                          onTap: () async {
                            // await Share.share(ManagerStrings.applicationUrl);
                          }),
                      const Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.stars,
                          textName: ManagerStrings.rates),
                      const Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.documentBlack,
                          textName: ManagerStrings.document),
                      const Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.logout,
                        textName: ManagerStrings.logout,
                        onTap: () {
                          controller.logout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
