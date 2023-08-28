import 'package:flutter_triad/features/forget_password/data/request/forget_password_request.dart';
import 'package:flutter_triad/features/forget_password/data/response/forget_password_response.dart';
import '../../../../core/network/app_api.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);
}

class RemoteForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  AppService _appService;

  RemoteForgetPasswordDataSourceImpl(this._appService);

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    return await _appService.forgetPassword(
      forgetPasswordRequest.email,
    );
  }
}
