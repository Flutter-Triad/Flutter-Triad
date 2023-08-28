import 'package:flutter_triad/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ResponseConstants.message)
  String? message;
}
