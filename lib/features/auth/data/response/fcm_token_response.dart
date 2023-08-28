import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'fcm_token_response.g.dart';

@JsonSerializable()
class FcmTokenResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  FcmTokenResponse({
    required this.status,
  });

  factory FcmTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenResponseFromJson(json);

  Map<String, dynamic> _toJson() => _$FcmTokenResponseToJson(this);
}
