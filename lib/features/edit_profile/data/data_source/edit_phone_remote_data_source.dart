import 'package:flutter_triad/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:flutter_triad/features/edit_profile/data/response/edit_phone_response.dart';

import '../../../../core/network/app_api.dart';

abstract class RemoteEditPhoneDataSource{
  Future<EditUserPhoneResponse> editPhone(EditPhoneRequest request);
}

class RemoteEditPhoneDataSourceImplement implements RemoteEditPhoneDataSource {
  AppService _appService;

  RemoteEditPhoneDataSourceImplement(this._appService);

  @override
  Future<EditUserPhoneResponse> editPhone(EditPhoneRequest request) async{
    return await _appService.editPhone(request.phone);
  }

}