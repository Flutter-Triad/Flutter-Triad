// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) =>
    BalanceResponse(
      balance: (json['balance'] as num?)?.toDouble(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'balance': instance.balance,
    };
