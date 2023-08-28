

import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.token)
  String? token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}