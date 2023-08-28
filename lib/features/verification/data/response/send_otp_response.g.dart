// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    SendOtpResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$SendOtpResponseToJson(SendOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
