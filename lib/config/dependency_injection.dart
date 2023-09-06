// Core imports
import 'package:flutter_triad/features/auth/data/repository_impl/fcm_token_repository_impl.dart';
import 'package:flutter_triad/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:flutter_triad/features/auth/presentation/controller/register_controller.dart';
import 'package:flutter_triad/features/edit_profile/data/data_source/edit_name_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/data_source/edit_phone_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/data_source/profile_remote_data_source.dart';
import 'package:flutter_triad/features/edit_profile/data/respository_impl/edit_name_repository_impl.dart';
import 'package:flutter_triad/features/edit_profile/data/respository_impl/edit_phone_repository_impl.dart';
import 'package:flutter_triad/features/edit_profile/data/respository_impl/profile_repository_impl.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/edit_name_repository.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/edit_phone_repository.dart';
import 'package:flutter_triad/features/edit_profile/domain/repository/profile_repository.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/edit_name_usecase.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/edit_phone_usecase.dart';
import 'package:flutter_triad/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:flutter_triad/features/home/data/repository_impl/images_repository_impl.dart';
import 'package:flutter_triad/features/home/domain/repository/images_repository.dart';
import 'package:flutter_triad/features/home/domain/usecase/images_usecase.dart';
import 'package:flutter_triad/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:flutter_triad/features/notifications/data/repo_impl/notifications_repo_impl.dart';
import 'package:flutter_triad/features/notifications/domain/repository/notifications_repository.dart';
import 'package:flutter_triad/features/notifications/domain/usecase/notifications_usecase.dart';
import 'package:flutter_triad/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:flutter_triad/features/profile/data/data_source/edit_password_remote_data_source.dart';
import 'package:flutter_triad/features/profile/data/repository_impl/edit_password_repository_impl.dart';
import 'package:flutter_triad/features/profile/domain/repository/balance_repository.dart';
import 'package:flutter_triad/features/profile/domain/repository/edit_password_repository.dart';
import 'package:flutter_triad/features/profile/domain/usecase/balance_usecase.dart';
import 'package:flutter_triad/features/profile/domain/usecase/edit_password_usecase.dart';
import 'package:flutter_triad/features/profile/presentation/controller/settings_controller.dart';
import 'package:flutter_triad/features/reset_password/data/data_souces/reset_password_remote_data_source.dart';
import 'package:flutter_triad/features/reset_password/data/repoitory_impl/reset_password_repository_impl.dart';
import 'package:flutter_triad/features/reset_password/domain/repositroy/reset_password_repositroy.dart';
import 'package:flutter_triad/features/reset_password/domain/usecase/reset_password_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Networking and API imports
import 'package:dio/dio.dart';
import '../core/network/app_api.dart';
import '../core/network/dio_factory.dart';

// Data sources
import '../features/auth/data/data_source/remote_data_source.dart';
import '../features/auth/domain/usecase/fcm_token_usecase.dart';
import '../features/forget_password/data/data_souces/remote_data_source.dart';
import '../features/home/data/data_source/remote_data_source.dart';
import '../features/profile/presentation/controller/locale_notifier_controller.dart';
import '../features/reset_password/presentation/controller/reset_password_controller.dart';
import '../features/verification/data/data_source/send_otp_remote_date_source.dart';
import '../features/verification/data/data_source/verify_email_remote_date_source.dart';

// Repositories
import '../features/auth/data/repository_impl/login_repository_impl.dart';
import '../features/auth/data/repository_impl/logout_repository_impl.dart';
import '../features/auth/data/repository_impl/register_repository_impl.dart';
import '../features/forget_password/data/repoitory_impl/forget_password_repository_impl.dart';
import '../features/verification/data/respository_impl/send_otp_respository_impl.dart';
import '../features/verification/data/respository_impl/verify_email_respository_impl.dart';

// Domain layer - repositories
import '../features/auth/domain/repository/login_repository.dart';
import '../features/auth/domain/repository/logout_repository.dart';
import '../features/auth/domain/repository/register_repository.dart';
import '../features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import '../features/verification/domain/repositories/send_otp_repository.dart';
import '../features/verification/domain/repositories/verify_email_repository.dart';

// Domain layer - use cases
import '../features/auth/domain/usecase/login_usecase.dart';
import '../features/auth/domain/usecase/logout_usecase.dart';
import '../features/auth/domain/usecase/register_usecase.dart';
import '../features/forget_password/domain/usecase/forget_password_usecase.dart';
import '../features/verification/domain/usecases/send_otp_usecase.dart';
import '../features/verification/domain/usecases/verify_email_usecase.dart';

// Presentation layer - controllers
import '../features/auth/presentation/controller/login_controller.dart';
import '../features/forget_password/presentation/controller/forget_pass_controller.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/outboarding/presentation/controller/out_boarding_controller.dart';
import '../features/profile/presentation/controller/profile_controller.dart';
import '../features/verification/presentation/controller/verification_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../features/main/presentation/controller/main_controller.dart';

// Other dependencies
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../core/internet_checker/interent_checker.dart';
import '../core/storage/local/app_settings_prefs.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }

  if (!GetIt.I.isRegistered<AppSettingsPrefs>()) {
    instance.registerLazySingleton<AppSettingsPrefs>(
        () => AppSettingsPrefs(instance()));
  }
  // ToDo: remove this code
  // AppSettingsPrefs _app = instance<AppSettingsPrefs>();
  // var pref = await SharedPreferences.getInstance();
  // pref.clear();

  AppSettingsPrefs _appSettings = instance<AppSettingsPrefs>();

  if (_appSettings.getEnableNotifications()) {
    // await initFirebaseNotification();
  }

  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(InternetConnectionCheckerPlus()));
  }
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }
  Dio dio = await instance<DioFactory>().getDio();
  if (!GetIt.I.isRegistered<AppService>()) {
    instance.registerLazySingleton<AppService>(() => AppService(dio));
  }
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

finishSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  finishSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

finishOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() async {
  finishSplash();
  finishOutBoarding();
  finishRegister();
  finishLogOut();
  initVerifyEmail();
  disposeResetPasswordModule();
  initFcmTokenModule();

  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
        () => RemoteLoginDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
        () => LoginRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<LoginRepository>()));
  }

  Get.put<LoginController>(LoginController());
}

finishLoginModule() async {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() async {
  finishLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
        () => RemoteRegisterDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
        () => RegisterRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(instance<RegisterRepository>()));
  }

  Get.put<RegisterController>(RegisterController());
}

finishRegister() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }
  Get.delete<RegisterController>();
}

initForgetPassword() async {
  finishLoginModule();

  if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.registerLazySingleton<ForgetPasswordDataSource>(
        () => RemoteForgetPasswordDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(
        instance<ForgetPasswordRepository>(),
      ),
    );
  }

  Get.put(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.unregister<ForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
}

initSendOtp() async {
  if (!GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.registerLazySingleton<RemoteSendOtpDataSource>(
        () => RemoteSendOtpDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.registerLazySingleton<SendOtpRepository>(
      () => SendOtpRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.registerFactory<SendOtpUseCase>(
      () => SendOtpUseCase(
        instance<SendOtpRepository>(),
      ),
    );
  }
}

disposeSendOtp() async {
  if (GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.unregister<RemoteSendOtpDataSource>();
  }

  if (GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.unregister<SendOtpRepository>();
  }

  if (GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.unregister<SendOtpUseCase>();
  }
}

initVerifyEmail() async {
  disposeForgetPassword();
  initSendOtp();
  if (!GetIt.I.isRegistered<RemoteVerifyEmailDataSource>()) {
    instance.registerLazySingleton<RemoteVerifyEmailDataSource>(
        () => RemoteVerifyEmailDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<VerifyEmailRepository>()) {
    instance.registerLazySingleton<VerifyEmailRepository>(
        () => VerifyEmailRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<VerifyEmailUseCase>()) {
    instance.registerFactory<VerifyEmailUseCase>(
        () => VerifyEmailUseCase(instance<VerifyEmailRepository>()));
  }

  Get.put<VerificationController>(VerificationController());
}

disposeVerifyEmail() async {
  disposeSendOtp();

  Get.delete<ForgetPasswordController>();

  if (GetIt.I.isRegistered<RemoteVerifyEmailDataSource>()) {
    instance.unregister<RemoteVerifyEmailDataSource>();
  }

  if (GetIt.I.isRegistered<VerifyEmailRepository>()) {
    instance.unregister<VerifyEmailRepository>();
  }

  if (GetIt.I.isRegistered<VerifyEmailUseCase>()) {
    instance.unregister<VerifyEmailUseCase>();
  }

  Get.delete<VerificationController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHome();

}

initHome() async {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
        () => RemoteHomeDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<ImagesRepository>()) {
    instance.registerLazySingleton<ImagesRepository>(
      () => ImagesRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ImagesUseCase>()) {
    instance.registerFactory<ImagesUseCase>(
      () => ImagesUseCase(
        instance<ImagesRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
  initProfile();
}

finishHome() async {
  if (GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.unregister<RemoteHomeDataSource>();
  }

  if (GetIt.I.isRegistered<ImagesRepository>()) {
    instance.unregister<ImagesRepository>();
  }

  if (GetIt.I.isRegistered<ImagesUseCase>()) {
    instance.unregister<ImagesUseCase>();
  }

  Get.delete<HomeController>();
}

initProfile() {
  initEditName();
  initEditPhone();
  initLogOut();
  initChangePassword();

  if (!GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.registerLazySingleton<RemoteProfileDataSource>(
        () => RemoteProfileDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<ProfileRepository>()) {
    instance.registerLazySingleton<ProfileRepository>(
        () => ProfileRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(
        () => ProfileUseCase(instance<ProfileRepository>()));
  }

  Get.put<LocaleNotifierController>(LocaleNotifierController());
  Get.put<ProfileController>(ProfileController());
}

disposeProfile() {
  Get.delete<ProfileController>();
  if (GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.unregister<RemoteProfileDataSource>();
  }

  if (GetIt.I.isRegistered<ProfileRepository>()) {
    instance.unregister<ProfileRepository>();
  }

  if (GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.unregister<ProfileUseCase>();
  }
}

finishProfile() {
  Get.delete<ProfileController>();
}


initCourse() {
  initProfile();
}

initLogOut() {
  if (!GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.registerLazySingleton<RemoteLogoutDataSource>(
        () => RemoteLogoutDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<LogoutRepository>()) {
    instance.registerLazySingleton<LogoutRepository>(
        () => LogoutRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(
        () => LogoutUseCase(instance<LogoutRepository>()));
  }
}

initEditName() {
  if (!GetIt.I.isRegistered<RemoteEditNameDataSource>()) {
    instance.registerLazySingleton<RemoteEditNameDataSource>(
        () => RemoteEditNameDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditNameRepository>()) {
    instance.registerLazySingleton<EditNameRepository>(
        () => EditNameRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditNameUseCase>()) {
    instance.registerFactory<EditNameUseCase>(
        () => EditNameUseCase(instance<EditNameRepository>()));
  }
}

initEditPhone() {
  if (!GetIt.I.isRegistered<RemoteEditPhoneDataSource>()) {
    instance.registerLazySingleton<RemoteEditPhoneDataSource>(
        () => RemoteEditPhoneDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditPhoneRepository>()) {
    instance.registerLazySingleton<EditPhoneRepository>(
        () => EditPhoneRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditPhoneUseCase>()) {
    instance.registerFactory<EditPhoneUseCase>(
        () => EditPhoneUseCase(instance<EditPhoneRepository>()));
  }
}

initChangePassword() {
  if (!GetIt.I.isRegistered<RemoteEditPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteEditPasswordDataSource>(
        () => RemoteEditPasswordDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditPasswordRepository>()) {
    instance.registerLazySingleton<EditPasswordRepository>(
        () => EditPasswordRepoImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditPasswordUseCase>()) {
    instance.registerFactory<EditPasswordUseCase>(
        () => EditPasswordUseCase(instance<EditPasswordRepository>()));
  }
}

disposeChangePassword() {
  if (GetIt.I.isRegistered<RemoteEditPasswordDataSource>()) {
    instance.unregister<RemoteEditPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<EditPasswordRepository>()) {
    instance.unregister<EditPasswordRepository>();
  }

  if (GetIt.I.isRegistered<EditPasswordUseCase>()) {
    instance.unregister<EditPasswordUseCase>();
  }
}

finishMainModule() {
  finishHome();
  finishProfile();
  Get.delete<MainController>();
}

finishLogOut() {
  if (GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.unregister<RemoteLogoutDataSource>();
  }

  if (GetIt.I.isRegistered<LogoutRepository>()) {
    instance.unregister<LogoutRepository>();
  }

  if (GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.unregister<LogoutUseCase>();
  }

  finishMainModule();
}

initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.registerLazySingleton<ResetPasswordRemoteDataSource>(
      () => RemoteResetPasswordRemoteDataSourceImpl(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(
        instance<NetworkInfo>(),
        instance<ResetPasswordRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(
        instance<ResetPasswordRepository>(),
      ),
    );
  }
  Get.put<ResetPasswordController>(ResetPasswordController());
}

disposeResetPasswordModule() {
  disposeForgetPassword();
  if (GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.unregister<ResetPasswordRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.unregister<ResetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }

  Get.delete<ResetPasswordController>();
}

initFcmTokenModule() {
  if (!GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
    instance.registerLazySingleton<RemoteFcmTokenDataSource>(
      () => RemoteFcmTokenDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<FcmTokenRepository>()) {
    instance.registerLazySingleton<FcmTokenRepository>(
      () => FcmTokenRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<FcmTokenUseCase>()) {
    instance.registerLazySingleton<FcmTokenUseCase>(
      () => FcmTokenUseCase(
        instance(),
      ),
    );
  }
}

initNotifications() {
  if (!GetIt.I.isRegistered<RemoteNotificationsDataSource>()) {
    instance.registerLazySingleton<RemoteNotificationsDataSource>(
      () => RemoteNotificationsDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<NotificationsRepository>()) {
    instance.registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepoImpl(
        instance<RemoteNotificationsDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.registerLazySingleton<NotificationsUseCase>(
      () => NotificationsUseCase(
        instance(),
      ),
    );
  }

  Get.put<NotificationsController>(NotificationsController());
}

disposeNotifications() {
  if (GetIt.I.isRegistered<RemoteNotificationsDataSource>()) {
    instance.unregister<RemoteNotificationsDataSource>();
  }

  if (GetIt.I.isRegistered<NotificationsRepository>()) {
    instance.unregister<NotificationsRepository>();
  }

  if (GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.unregister<NotificationsUseCase>();
  }
  Get.delete<NotificationsController>();
}

disposeBalance() {
  if (GetIt.I.isRegistered<BalanceRepository>()) {
    instance.unregister<BalanceRepository>();
  }

  if (GetIt.I.isRegistered<BalanceUseCase>()) {
    instance.unregister<BalanceUseCase>();
  }
}

initSettingModule() {
  Get.put<SettingsController>(SettingsController());
}

disposeSettingModule() {
  disposeBalance();
  Get.delete<SettingsController>();
}
