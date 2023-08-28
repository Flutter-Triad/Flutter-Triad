// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenResponse _$FcmTokenResponseFromJson(Map<String, dynamic> json) =>
    FcmTokenResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$FcmTokenResponseToJson(FcmTokenResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
