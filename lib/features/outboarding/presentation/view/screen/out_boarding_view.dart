import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/out_boarding_controller.dart';
import '../widget/circle_button.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
          ),
          child: GetBuilder<OutBoardingController>(
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: ManagerHeight.h20),
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        controller.skipPage();
                      },
                      child: Text(
                        controller.getCurrentPage() != 2
                            ? ManagerStrings.skip
                            : ManagerStrings.empty,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 24,
                    child: PageView(
                      controller: controller.pageController,
                      children: [
                        ...controller.outBoardingItems,
                      ],
                      onPageChanged: (index) {
                        controller.setCurrentIndex(
                          index,
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.isNotLastedPage(),
                    replacement: mainButton(
                      onPressed: () {
                        controller.getStart();
                      },
                      child: Text(
                        ManagerStrings.getStartButton,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s15,
                          color: ManagerColors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      height: ManagerHeight.h40,
                      color: ManagerColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: controller.showBackButton(),
                          child: circleButton(
                            onPressed: () {
                              controller.previousPage();
                            },
                            iconData: Icons.arrow_back_outlined,
                          ),
                        ),
                        circleButton(
                          onPressed: () {
                            controller.nextPage();
                          },
                          iconData: Icons.arrow_forward_outlined,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
