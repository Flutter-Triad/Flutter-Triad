import 'package:flutter_triad/features/profile/data/request/edit_password_request.dart';
import 'package:flutter_triad/features/profile/data/response/edit_password_response.dart';

import '../../../../core/network/app_api.dart';

abstract class RemoteEditPasswordDataSource {
  Future<EditPasswordResponse> editPassword(EditPasswordRequest request);
}

class RemoteEditPasswordDateSourceImplement
    implements RemoteEditPasswordDataSource {
  AppService _appService;

  RemoteEditPasswordDateSourceImplement(this._appService);

  @override
  Future<EditPasswordResponse> editPassword(EditPasswordRequest request) async {
    return await _appService.editPassword(request.password, request.confirmPassword);
  }
}
