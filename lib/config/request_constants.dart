const String apiRes = "/api/auth/user";

class RequestsConstants {
  static const String loginRequest = '$apiRes/login';
  static const String registerRequest = '$apiRes/Register';
  static const String forgetPasswordRequest = '$apiRes/forgot-password';
  static const String notificationsRequest = '$apiRes/notifications';
  static const String sendOtp = '$apiRes/send-email-verification-code';
  static const String verifyEmail = '$apiRes/email-verification';
  static const String logout = '$apiRes/logout';
  static const String balanceRequest = '$apiRes/user-balance';
  static const String email = 'email';
  static const String name = 'name';
  static const String otp = 'otp';
  static const String categoryId = 'category_id';
  static const String phoneNumber = 'phone';
  static const String password = 'password';
  static const String paymentMethodId = 'payment_method_id';
  static const String value = 'value';
  static const String startDate = 'start_date';
  static const String passwordConfirmation = 'password_confirmation';
  static const String fcmToken = 'fcm_token';
  static const String images = '$apiRes/images';
  static const String editName = '$apiRes/edit-user-name';
  static const String editPhone = '$apiRes/edit-user-phone';
  static const String profile = '$apiRes/user-profile';
  static const String editPassword = '$apiRes/edit-user-password';
  static const String resetPassword = '$apiRes/reset-password';
  static const String fcmTokenUpdate = '$apiRes/fcm_token_update';
  static const String paymentMethods = '$apiRes/payment-methods/index';
}
