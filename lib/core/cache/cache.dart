
class CacheData {
  static String email = "";
  static String username = "";
  static String phone = "";


  void setEmail(String value) {
    CacheData.email = value;
  }

  String getEmail() {
    return email;
  }

  void setUsername(String value) {
    CacheData.username = value;
  }

  String getUsername() {
    return username;
  }

  void setPhone(String value) {
    CacheData.phone = value;
  }

  String getPhone() {
    return phone;
  }

}
