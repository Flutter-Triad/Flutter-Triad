import 'package:flutter_triad/features/edit_profile/data/response/edit_name_response.dart';

import '../../../../core/network/app_api.dart';
import '../request/edit_name_request.dart';

abstract class RemoteEditNameDataSource{
  Future<EditUserNameResponse> editName(EditNameRequest request);
}

class RemoteEditNameDataSourceImplement implements RemoteEditNameDataSource {
  AppService _appService;

  RemoteEditNameDataSourceImplement(this._appService);

  @override
  Future<EditUserNameResponse> editName(EditNameRequest request) async{
    return await _appService.editName(request.name);
  }

}