import 'package:flutter_triad/config/localization/locales.dart';
import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/core/widgets/CustomAppBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/locale_notifier_controller.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.localePage,
        hasLeading: true,
      ),
      body: GetBuilder<LocaleNotifierController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Container(
                width: double.infinity,
                height: ManagerHeight.h50,
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                decoration: BoxDecoration(
                  border: Border.all(color: ManagerColors.greyLight),
                  borderRadius: BorderRadius.circular(ManagerRadius.r10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownStyleData: DropdownStyleData(
                      elevation: 0,
                      decoration: BoxDecoration(
                        color: ManagerColors.white,
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                      ),
                    ),
                    customButton: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ManagerWidth.w10,
                        ),
                        const Icon(
                          Icons.language,
                          color: ManagerColors.primaryColor,
                        ),
                        SizedBox(width: ManagerWidth.w10),
                        Text(
                          ManagerStrings.lang,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          LocaleSettings.languages[controller.currentLanguage]
                              .onNull(),
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w10),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: ManagerIconSize.s16,
                          color: ManagerColors.primaryColor,
                        ),
                        SizedBox(
                          width: ManagerWidth.w10,
                        ),
                      ],
                    ),
                    items: controller.languagesList.values.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    value: LocaleSettings.languages[controller.currentLanguage],
                    onChanged: (value) {
                      for (var entry in controller.languagesList.entries) {
                        if (entry.value == value) {
                          controller.changeLanguage(
                            context: context,
                            languageCode: entry.key,
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
