// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAttributesResponse _$UserAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    UserAttributesResponse(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$UserAttributesResponseToJson(
        UserAttributesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
    };

AttributesUserResponse _$AttributesUserResponseFromJson(
        Map<String, dynamic> json) =>
    AttributesUserResponse(
      attributes: json['attributes'] == null
          ? null
          : UserAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$AttributesUserResponseToJson(
        AttributesUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'attributes': instance.attributes,
    };
