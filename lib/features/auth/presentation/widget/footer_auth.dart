import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_sizes_util.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class FooterAuth extends StatelessWidget {
  final String text;
  final String buttonName;
  final Function() onPressed;

  const FooterAuth({
    super.key,
    required this.text,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: ManagerHeight.h28,
      ),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s14,
                color: ManagerColors.textColorLight,
              ),
            ),
            Text(
              buttonName,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s14,
                decoration: TextDecoration.underline,
                color: ManagerColors.primaryColor,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
