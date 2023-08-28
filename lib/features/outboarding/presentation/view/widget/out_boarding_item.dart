import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_styles.dart';
import 'slider_indicator.dart';

class OutBoardingItem extends StatelessWidget {
  String title;
  String subTitle;
  String image;

  OutBoardingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: ManagerHeight.h20,
        ),
        SvgPicture.asset(
          image,
          height: size.height * (0.3),
        ),
        SizedBox(
          height: ManagerHeight.h60,
        ),
        SizedBox(
          width: ManagerWidth.w205,
          height: ManagerHeight.h4,
          child: const SliderIndicator(),
        ),
        SizedBox(
          height: ManagerHeight.h28,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s20,
            color: ManagerColors.textColor,
          ),
        ),
        SizedBox(
          height: ManagerHeight.h20,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: getRegularTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.greyLight,
          ),
        ),
      ],
    );
  }
}
