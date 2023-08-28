import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import 'notification_response.dart';

part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsResponse {
  @JsonKey(name: ResponseConstants.data)
  List<NotificationResponse>? notifications;

  NotificationsResponse({this.notifications});

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}
