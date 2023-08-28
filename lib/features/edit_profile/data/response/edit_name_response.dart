import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'user_attributes_response.dart';
part 'edit_name_response.g.dart';


@JsonSerializable()
class EditUserNameResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  @JsonKey(name: ResponseConstants.data)
  AttributesUserResponse? data;



  EditUserNameResponse({required this.status, required this.data,});

  factory EditUserNameResponse.fromJson(Map<String, dynamic> json) =>
      _$EditUserNameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditUserNameResponseToJson(this);
}