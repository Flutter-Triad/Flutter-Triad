import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: ResponseConstants.id)
  String? id;
  @JsonKey(name: ResponseConstants.title)
  String? title;
  @JsonKey(name: ResponseConstants.body)
  String? body;

  NotificationResponse({this.id, this.title, this.body});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
