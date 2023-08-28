// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterRequest {
  String fullName;
  String email;
  String phone;
  String password;
  String confirmPassword;
  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}
