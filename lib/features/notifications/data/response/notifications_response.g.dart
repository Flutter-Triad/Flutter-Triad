// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      notifications: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.notifications,
    };
