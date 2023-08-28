import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'profile_attributes_response.g.dart';
@JsonSerializable()
class ProfileAttributesResponse  {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.email)
  String? email;
  @JsonKey(name: ResponseConstants.phone)
  String? phone;
  @JsonKey(name: ResponseConstants.avatar)
  String? avatar;

  ProfileAttributesResponse(
      {required this.name,
      required this.email,
      required this.phone,
      required this.avatar});

  factory ProfileAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAttributesResponseToJson(this);
}
