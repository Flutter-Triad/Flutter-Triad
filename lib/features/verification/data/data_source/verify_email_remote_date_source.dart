import 'package:flutter_triad/features/verification/data/response/verify_email_response.dart';
import '../../../../core/network/app_api.dart';
import '../request/verify_email_request.dart';

abstract class RemoteVerifyEmailDataSource {
  Future<VerifyEmailResponse> verifyEmail(
      VerifyEmailRequest verifyEmailRequest);
}

class RemoteVerifyEmailDataSourceImpl implements RemoteVerifyEmailDataSource {
  AppService _AppService;

  RemoteVerifyEmailDataSourceImpl(this._AppService);

  @override
  Future<VerifyEmailResponse> verifyEmail(
      VerifyEmailRequest verifyEmailRequest) async {
    return await _AppService.verifyEmail(
      verifyEmailRequest.email,
      verifyEmailRequest.otp,
    );
  }
}
