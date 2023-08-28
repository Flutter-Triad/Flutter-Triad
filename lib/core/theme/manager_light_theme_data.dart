import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,

    /// main color of the app
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    primaryColorDark: ManagerColors.primaryColorDark,
    disabledColor: ManagerColors.textColor,
    // this for disabled button color
    splashColor: ManagerColors.greyLight,
    backgroundColor: ManagerColors.background,
    scaffoldBackgroundColor: ManagerColors.background,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.white,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontSize.s14,
      ),
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorLight,
    ),

    /// Text Theme
    textTheme: ManagerTextThemeLight(),
  );
}
