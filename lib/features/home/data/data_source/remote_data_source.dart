import 'package:flutter_triad/core/network/app_api.dart';

import '../response/images_response.dart';

abstract class RemoteHomeDataSource {
  Future<ImagesResponse> images();
}

class RemoteHomeDataSourceImplement implements RemoteHomeDataSource {
  final AppService _appService;

  RemoteHomeDataSourceImplement(this._appService);

  @override
  Future<ImagesResponse> images() async {
    return await _appService.images();
  }
}
