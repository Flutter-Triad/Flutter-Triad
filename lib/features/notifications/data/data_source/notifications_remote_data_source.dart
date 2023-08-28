import 'package:flutter_triad/features/notifications/data/response/notifications_response.dart';

import '../../../../core/network/app_api.dart';

abstract class RemoteNotificationsDataSource {
  Future<NotificationsResponse> notifications();
}

class RemoteNotificationsDataSourceImplement
    implements RemoteNotificationsDataSource {
  AppService _appService;

  RemoteNotificationsDataSourceImplement(this._appService);

  @override
  Future<NotificationsResponse> notifications() async {
    return await _appService.notifications();
  }
}
