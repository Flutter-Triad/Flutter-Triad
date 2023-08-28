import 'package:flutter_triad/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'balance_response.g.dart';

@JsonSerializable()
class BalanceResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.balance)
  double? balance;

  BalanceResponse({
    required this.balance,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);
}
