
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'verify_email_response.g.dart';

@JsonSerializable()
class VerifyEmailResponse  extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  VerifyEmailResponse({required this.status});

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);
}