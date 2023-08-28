// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPasswordAttributesResponse _$EditPasswordAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    EditPasswordAttributesResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$EditPasswordAttributesResponseToJson(
        EditPasswordAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
