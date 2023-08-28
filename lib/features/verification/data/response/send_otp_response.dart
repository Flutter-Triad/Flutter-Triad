

import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOtpResponse  extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  SendOtpResponse({required this.status});

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpResponseToJson(this);
}