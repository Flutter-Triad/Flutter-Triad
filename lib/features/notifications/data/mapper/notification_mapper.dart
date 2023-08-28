import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/notifications/data/response/notification_response.dart';
import 'package:flutter_triad/features/notifications/domain/model/notification_model.dart';

extension NotificationMapper on NotificationResponse {
  NotificationModel toDomain() => NotificationModel(
      id: this.id.onNull(),
      title: this.title.onNull(),
      body: this.body.onNull());
}
