import 'package:flutter_triad/core/extensions/extensions.dart';
import 'package:flutter_triad/features/verification/data/response/send_otp_response.dart';
import 'package:flutter_triad/features/verification/domain/models/send_otp_model.dart';

extension SendOtpMapper on SendOtpResponse {
  toDomain() => SendOtpModel(status: this.status?.onNull());
}
