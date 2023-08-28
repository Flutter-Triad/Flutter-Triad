import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse  extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  ForgetPasswordResponse({required this.status});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
