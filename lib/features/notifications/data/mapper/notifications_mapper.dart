import 'package:flutter_triad/features/notifications/data/mapper/notification_mapper.dart';
import 'package:flutter_triad/features/notifications/data/response/notifications_response.dart';
import 'package:flutter_triad/features/notifications/domain/model/notifications_model.dart';

extension NotificationsMapper on NotificationsResponse {
  NotificationsModel toDomain() => NotificationsModel(
        notifications: this.notifications!.map((e) => e.toDomain()).toList(),
      );
}
