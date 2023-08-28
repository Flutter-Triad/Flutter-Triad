// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
