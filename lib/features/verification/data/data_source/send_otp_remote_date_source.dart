import 'package:flutter_triad/features/verification/data/request/send_otp_request.dart';
import 'package:flutter_triad/features/verification/data/response/send_otp_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteSendOtpDataSource {
  Future<SendOtpResponse> sendOtp(SendOtpRequest sendOtpRequest);
}

class RemoteSendOtpDataSourceImpl implements RemoteSendOtpDataSource {
  AppService _AppService;

  RemoteSendOtpDataSourceImpl(this._AppService);

  @override
  Future<SendOtpResponse> sendOtp(SendOtpRequest sendOtpRequest) async {
    return await _AppService.sendOtp(
      sendOtpRequest.email,
    );
  }
}
