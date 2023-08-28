import 'package:flutter_triad/features/auth/data/request/fvm_token_request.dart';
import 'package:flutter_triad/features/auth/data/request/register_request.dart';
import 'package:flutter_triad/features/auth/data/response/register_response.dart';

import '../../../../core/network/app_api.dart';
import '../request/login_request.dart';
import '../response/fcm_token_response.dart';
import '../response/login_response.dart';
import '../response/logout_response.dart';

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteLoginDateSourceImplement implements RemoteLoginDataSource {
  AppService _appService;

  RemoteLoginDateSourceImplement(this._appService);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appService.login(loginRequest.email, loginRequest.password);
  }
}

abstract class RemoteRegisterDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}

class RemoteRegisterDateSourceImplement implements RemoteRegisterDataSource {
  AppService _AppService;

  RemoteRegisterDateSourceImplement(this._AppService);

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _AppService.register(
        registerRequest.fullName,
        registerRequest.email,
        registerRequest.phone,
        registerRequest.password,
        registerRequest.confirmPassword);
  }
}

abstract class RemoteLogoutDataSource {
  Future<LogoutResponse> logout();
}

class RemoteLogoutDataSourceImplement implements RemoteLogoutDataSource {
  AppService _AppService;

  RemoteLogoutDataSourceImplement(this._AppService);

  @override
  Future<LogoutResponse> logout() async {
    return await _AppService.logout();
  }
}

abstract class RemoteFcmTokenDataSource {
  Future<FcmTokenResponse> fcmToken(FcmTokenRequest fcmTokenRequest);
}

class RemoteFcmTokenDataSourceImplement implements RemoteFcmTokenDataSource {
  AppService _appService;

  RemoteFcmTokenDataSourceImplement(this._appService);

  @override
  Future<FcmTokenResponse> fcmToken(FcmTokenRequest fcmTokenRequest) async {
    return await _appService.fcmTokenUpdate(fcmTokenRequest.fcmToken);
  }
}
