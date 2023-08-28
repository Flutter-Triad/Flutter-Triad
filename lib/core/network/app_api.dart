import 'package:flutter_triad/config/constants.dart';
import 'package:flutter_triad/config/request_constants.dart';
import 'package:flutter_triad/features/auth/data/response/fcm_token_response.dart';
import 'package:flutter_triad/features/auth/data/response/register_response.dart';
import 'package:flutter_triad/features/edit_profile/data/response/edit_name_response.dart';
import 'package:flutter_triad/features/edit_profile/data/response/edit_phone_response.dart';
import 'package:flutter_triad/features/edit_profile/data/response/profile_response.dart';
import 'package:flutter_triad/features/home/data/response/images_response.dart';
import 'package:flutter_triad/features/notifications/data/response/notifications_response.dart';
import 'package:flutter_triad/features/profile/data/response/edit_password_response.dart';
import 'package:flutter_triad/features/verification/data/response/verify_email_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/response/login_response.dart';
import '../../features/auth/data/response/logout_response.dart';
import '../../features/forget_password/data/response/forget_password_response.dart';
import '../../features/reset_password/data/response/reset_password_response.dart';
import '../../features/verification/data/response/send_otp_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  // Login Request
  @POST(RequestsConstants.loginRequest)
  Future<LoginResponse> login(@Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.password) String password);

  @POST(RequestsConstants.registerRequest)
  Future<RegisterResponse> register(
      @Field(RequestsConstants.name) String fullName,
      @Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.phoneNumber) String phone,
      @Field(RequestsConstants.password) String password,
      @Field(RequestsConstants.passwordConfirmation) String confirmPassword);

  @POST(RequestsConstants.forgetPasswordRequest)
  Future<ForgetPasswordResponse> forgetPassword(
    @Field(RequestsConstants.email) String email,
  );

  @POST(RequestsConstants.sendOtp)
  Future<SendOtpResponse> sendOtp(
    @Field(RequestsConstants.email) String email,
  );

  @POST(RequestsConstants.verifyEmail)
  Future<VerifyEmailResponse> verifyEmail(
      @Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.otp) String otp);

  @POST(RequestsConstants.logout)
  Future<LogoutResponse> logout();

  @GET(RequestsConstants.images)
  Future<ImagesResponse> images();

  @POST(RequestsConstants.editName)
  Future<EditUserNameResponse> editName(
    @Field(RequestsConstants.name) String name,
  );

  @POST(RequestsConstants.editPhone)
  Future<EditUserPhoneResponse> editPhone(
    @Field(RequestsConstants.phoneNumber) String phone,
  );

  @GET(RequestsConstants.profile)
  Future<ProfileResponse> profile();

  @POST(RequestsConstants.editPassword)
  Future<EditPasswordResponse> editPassword(
    @Field(RequestsConstants.password) password,
    @Field(RequestsConstants.passwordConfirmation) passwordConfirmation,
  );

  @POST(RequestsConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(RequestsConstants.email) email,
    @Field(RequestsConstants.password) password,
    @Field(RequestsConstants.otp) otp,
  );

  @POST(RequestsConstants.fcmTokenUpdate)
  Future<FcmTokenResponse> fcmTokenUpdate(
    @Field(RequestsConstants.fcmToken) fcmToken,
  );

  @GET(RequestsConstants.notificationsRequest)
  Future<NotificationsResponse> notifications();

}
