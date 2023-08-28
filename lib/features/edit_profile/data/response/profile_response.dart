
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'profile_attributes_response.dart';
part 'profile_response.g.dart';


@JsonSerializable()
class ProfileResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.data)
  ProfileResponseData? data;

  ProfileResponse({ required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileResponseData{
  @JsonKey(name: ResponseConstants.type)
  String? type;
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  ProfileAttributesResponse? attributes;

  ProfileResponseData({ required this.id , required this.type, required this.attributes});

  factory ProfileResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseDataToJson(this);
}