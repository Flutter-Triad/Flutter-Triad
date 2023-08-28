import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'user_attributes_response.dart';
part 'edit_phone_response.g.dart';


@JsonSerializable()
class EditUserPhoneResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  @JsonKey(name: ResponseConstants.data)
  AttributesUserResponse? data;



  EditUserPhoneResponse({required this.status, required this.data,});

  factory EditUserPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$EditUserPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditUserPhoneResponseToJson(this);
}