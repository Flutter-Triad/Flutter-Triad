import 'package:flutter_triad/core/resources/manager_colors.dart';
import 'package:flutter_triad/core/resources/manager_fonts.dart';
import 'package:flutter_triad/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;

  CustomAppBar({required this.title, this.hasLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ManagerColors.transparent,
      elevation: Constants.elevation,
      title: Text(
        title,
        style: getMediumTextStyle(
          fontSize: ManagerFontSize.s18,
          color: ManagerColors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
