import 'package:flutter_triad/core/resources/manager_assets.dart';
import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter_triad/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_general_item.dart';

class CustomGeneral extends StatelessWidget {
  const CustomGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h20,
        horizontal: ManagerWidth.w20,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.backgroundForm,
        borderRadius: BorderRadius.circular(
          ManagerRadius.r16,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ManagerColors.greyLight,
            offset: Offset(0.0, 2.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ManagerStrings.general,
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s16,
              color: ManagerColors.black,
            ),
          ),
          Divider(),
          custom_general_item(
            icon: ManagerAssets.credit,
            title: ManagerStrings.credit,
          ),
          Divider(),
          custom_general_item(
            icon: ManagerAssets.global,
            title: ManagerStrings.language,
            onPressed: () {
              Navigator.pushNamed(context, Routes.localeView);
            },
          ),
          Divider(),
          custom_general_item(
            icon: ManagerAssets.credit,
            title: ManagerStrings.payment,
            
          ),
        ],
      ),
    );
  }
}
