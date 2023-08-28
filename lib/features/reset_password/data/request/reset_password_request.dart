class ResetPasswordRequest {
  String email;
  String password;
  String otp;

  ResetPasswordRequest({
   required this.email,
   required this.password,
    required this.otp,
  });
}
