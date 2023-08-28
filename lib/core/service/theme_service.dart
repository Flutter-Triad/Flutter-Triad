import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/storage/local/app_settings_prefs.dart';
import 'package:flutter_triad/core/theme/manager_dark_theme_data.dart';
import 'package:flutter_triad/core/theme/manager_light_theme_data.dart';
import 'package:flutter/material.dart';

class ThemeService {
  late final AppSettingsPrefs _appSettingsPrefs;

  ThemeService() : _appSettingsPrefs = instance<AppSettingsPrefs>();

  bool isDarkMode() => _appSettingsPrefs.getAppTheme() == Constants.dark;

  ThemeMode getThemeMode() => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  ThemeData getThemeData() =>
      isDarkMode() ? managerDarkThemeData() : managerLightThemeData();
}
