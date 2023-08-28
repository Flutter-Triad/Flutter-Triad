
import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
part 'logout_response.g.dart';
@JsonSerializable()
class LogoutResponse  extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  LogoutResponse({required this.status});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
