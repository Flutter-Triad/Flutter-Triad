import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/out_boarding_controller.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OutBoardingController>(

      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: ManagerColors.greyLight,
            borderRadius: BorderRadius.circular(
              ManagerRadius.r8,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                controller.outBoardingItems.length,
                (index) => AnimatedContainer(
                  duration: const Duration(
                    milliseconds: Constants.sliderTimeMillSecond,
                  ),
                  width:  ManagerWidth.w68,
                  height: ManagerHeight.h4,
                  decoration: BoxDecoration(
                    color: controller.getCurrentPage() == index ? ManagerColors.primaryColor
                        : ManagerColors.greyLight,
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
