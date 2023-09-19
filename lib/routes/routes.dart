import 'package:flutter_triad/config/dependency_injection.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/features/auth/presentation/view/login_view.dart';
import 'package:flutter_triad/features/auth/presentation/view/register_view.dart';
import 'package:flutter_triad/features/edit_profile/presentation/view/screen/edit_profile_view.dart';
import 'package:flutter_triad/features/forget_password/presentation/view/forget_pass_view.dart';
import 'package:flutter_triad/features/home/presentation/view/screen/home_view.dart';
import 'package:flutter_triad/features/main/presentation/view/main_view.dart';
import 'package:flutter_triad/features/profile/presentation/view/screen/change_pass_view.dart';
import 'package:flutter_triad/features/profile/presentation/view/screen/locale_view.dart';
import 'package:flutter_triad/features/profile/presentation/view/screen/setting_view.dart';
import 'package:flutter_triad/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:flutter_triad/features/search/presentation/view/search_view.dart';
import 'package:flutter_triad/features/verification/presentation/view/screen/verification_screen.dart';
import 'package:flutter/material.dart';
import '../features/notifications/presentation/view/notifications_view.dart';
import '../features/outboarding/presentation/view/screen/out_boarding_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoarding = '/outBoarding_view';
  static const String login = '/login_view';
  static const String register = '/register_view';
  static const String home = '/home_view';
  static const String forgetPassword = '/forgetPassword';
  static const String verification = '/verification_view';
  static const String main = '/main_view';
  static const String setting = '/setting_view';
  static const String search = '/search_view';
  static const String editProfile = '/editProfile';
  static const String changePassword = '/changePassword';
  static const String resetPassword = '/resetPassword';
  static const String localeView = '/locale_view';
  static const String notifications = '/notifications';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoarding:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgetPassword:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => ForgetPassView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.verification:
        initVerifyEmail();
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case Routes.main:
        initMainModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.setting:
        initSettingModule();
        return MaterialPageRoute(builder: (_) => SettingView());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => SearchView());
      case Routes.editProfile:
        initProfile();
        return MaterialPageRoute(builder: (_) => EditProfileView());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => ChangePassView());
      case Routes.resetPassword:
        initResetPasswordModule();
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      case Routes.localeView:
        return MaterialPageRoute(builder: (_) => LocaleView());
      case Routes.notifications:
        initNotifications();
        return MaterialPageRoute(builder: (_) => NotificationsView());
      default:
        return unDefinedRoute();
    }
  }

  // If PushNamed Failed Return This Page With No Actions
  // This Screen Will Tell The User This Page Is Not Exist
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.noRouteFound),
        ),
        body: Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
