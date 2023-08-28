// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserPhoneResponse _$EditUserPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    EditUserPhoneResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : AttributesUserResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$EditUserPhoneResponseToJson(
        EditUserPhoneResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
