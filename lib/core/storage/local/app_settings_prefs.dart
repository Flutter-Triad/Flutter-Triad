import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/constants.dart';

class AppSettingsPrefs {
  final SharedPreferences _sharedPreferences;

  clear(){
    _sharedPreferences. clear();
  }
  AppSettingsPrefs(this._sharedPreferences);

  // Locale
  String getLocale() {
    return _sharedPreferences
        .getString(Constants.prefKeyLocale)
        .pareWithDefaultLocale();
  }

  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(Constants.prefKeyLocale, locale);
  }

  // OutBoarding Screen Shared Preferences
  Future<void> setOutBoardingScreenViewed() async {
    await _sharedPreferences.setBool(Constants.prefOutBoardingViewedKey, true);
  }

  bool getOutBoardingScreenViewed() {
    return _sharedPreferences
        .getBool(Constants.prefOutBoardingViewedKey)
        .onNull();
  }

  Future<void> removeCachedUserData() async {
    await _sharedPreferences.remove(Constants.prefKeyIsLoggedIn);
    await _sharedPreferences.remove(Constants.prefKeyEmail);
    await _sharedPreferences.remove(Constants.prefKeyToken);
  }

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(Constants.prefKeyIsLoggedIn, true);
  }

  bool getUserLoggedIn() {
    return _sharedPreferences.getBool(Constants.prefKeyIsLoggedIn).onNull();
  }

  Future<void> setEmail(String email) async {
    await _sharedPreferences.setString(Constants.prefKeyEmail, email);
  }

  String getEmail() {
    return _sharedPreferences.getString(Constants.prefKeyEmail).onNull();
  }

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(Constants.prefKeyToken, token);
  }

  String getToken() {
    return _sharedPreferences.getString(Constants.prefKeyToken).onNull();
  }

  Future<void> setAppTheme(String theme) async {
    await _sharedPreferences.setString(Constants.prefKeyTheme, theme);
  }

  String getAppTheme() {
    return _sharedPreferences.getString(Constants.prefKeyTheme).toString();
  }

  void setUserName(String name) async {
    await _sharedPreferences.setString(Constants.username, name);
  }

  String getUserName() {
    return _sharedPreferences.getString(Constants.username).onNull();
  }

  void setUserPhone(String phone) async {
    await _sharedPreferences.setString(Constants.phone, phone);
  }

  String getUserPhone() {
    return _sharedPreferences.getString(Constants.phone).onNull();
  }

  Future<void> setHasProfileData() async {
    await _sharedPreferences.setBool(Constants.hasProfileData, true);
  }

  bool getHasProfileData() {
    return _sharedPreferences.getBool(Constants.hasProfileData).onNull();
  }

  Future<void> setEnableNotifications(bool status) async {
    await _sharedPreferences.setBool(Constants.enableNotification, status);
  }

  bool getEnableNotifications() {
    return _sharedPreferences.getBool(Constants.enableNotification).onNotify();
  }
}
