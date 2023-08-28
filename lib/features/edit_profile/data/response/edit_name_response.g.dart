// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserNameResponse _$EditUserNameResponseFromJson(
        Map<String, dynamic> json) =>
    EditUserNameResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : AttributesUserResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$EditUserNameResponseToJson(
        EditUserNameResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
