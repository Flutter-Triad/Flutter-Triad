// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPasswordResponseData _$EditPasswordResponseDataFromJson(
        Map<String, dynamic> json) =>
    EditPasswordResponseData(
      type: json['type'] as String?,
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : EditPasswordAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditPasswordResponseDataToJson(
        EditPasswordResponseData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes,
    };
