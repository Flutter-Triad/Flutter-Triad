import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_dark.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    // TODO: CHECK THIS
    useMaterial3: true,

    /// main color of the app
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    primaryColorDark: ManagerColors.primaryColorDark,

    // this for disabled button color
    disabledColor: ManagerColors.textColor,

    splashColor: ManagerColors.greyLight,
    backgroundColor: ManagerColors.background,
    scaffoldBackgroundColor: ManagerColors.primaryColor,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
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
      buttonColor: ManagerColors.buttonColorDarK,
    ),

    /// Text Theme
    textTheme: ManagerTextThemeDark(),
  );
}
