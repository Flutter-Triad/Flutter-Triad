import 'package:flutter_triad/features/edit_profile/data/response/profile_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteProfileDataSource{
  Future<ProfileResponse> profile();
}

class RemoteProfileDataSourceImplement implements RemoteProfileDataSource {
  AppService _appService;

  RemoteProfileDataSourceImplement(this._appService);

  @override
  Future<ProfileResponse> profile() async{
    return await _appService.profile();
  }

}