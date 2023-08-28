// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAttributesResponse _$ProfileAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileAttributesResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ProfileAttributesResponseToJson(
        ProfileAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
