// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      data: json['data'] == null
          ? null
          : ProfileResponseData.fromJson(json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ProfileResponseData _$ProfileResponseDataFromJson(Map<String, dynamic> json) =>
    ProfileResponseData(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : ProfileAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseDataToJson(
        ProfileResponseData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes,
    };
