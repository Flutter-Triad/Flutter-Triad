

class UserAttributesModel{
  String? phone;
  String? name;
  String? email;
  UserAttributesModel({required this.phone, required this.email, required this.name});
}

class AttributesUserModel{
  UserAttributesModel? attributes;
  AttributesUserModel({required this.attributes});
}