import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'edit_password_attributes_response.g.dart';
@JsonSerializable()
class EditPasswordAttributesResponse  {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.email)
  String? email;
  @JsonKey(name: ResponseConstants.phone)
  String? phone;
  @JsonKey(name: ResponseConstants.avatar)
  String? avatar;

  EditPasswordAttributesResponse(
      {required this.name,
      required this.email,
      required this.phone,
      required this.avatar});

  factory EditPasswordAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$EditPasswordAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditPasswordAttributesResponseToJson(this);
}
