import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/features/profile/presentation/view/widget/custom_account.dart';
import 'package:flutter_triad/features/profile/presentation/view/widget/custom_general.dart';
import 'package:flutter_triad/features/profile/presentation/view/widget/custom_notification.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        backgroundColor: ManagerColors.primaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: ManagerColors.white),
        title: Text(
          ManagerStrings.setting,
          style: getMediumTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.white),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: ManagerHeight.h60,
                color: ManagerColors.primaryColor,
              ),
              CustomNotification(),
            ],
          ),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          CustomGeneral(),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          CustomAccount()
        ],
      ),
    );
  }

  @override
  void dispose() {
    disposeSettingModule();
    super.dispose();
  }
}
