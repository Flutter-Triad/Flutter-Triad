import 'package:flutter/material.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_styles.dart';

Widget notification(String title, String body, String id) {
  return Column(
    children: [
      LayoutBuilder(
        builder: (BuildContext context, box) {
          return Column(
            children: [
              MaterialButton(
                height: ManagerHeight.h40,
                onPressed: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            ManagerAssets.notifications,
                            width: ManagerWidth.w30,
                            height: ManagerHeight.h30,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: box.maxWidth - ManagerWidth.w80,
                                child: Text(
                                  title,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s20,
                                    color: ManagerColors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ManagerHeight.h4,
                              ),
                              Container(
                                child: Text(
                                  body,
                                  style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                                width: box.maxWidth - ManagerWidth.w80,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: ManagerHeight.h10,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                color: ManagerColors.greyLight,
              ),
            ],
          );
        },
      ),
    ],
  );
}
