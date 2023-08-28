import 'package:flutter_triad/features/verification/data/request/send_otp_request.dart';
import 'package:flutter_triad/features/verification/domain/models/send_otp_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
abstract class SendOtpRepository{
  Future<Either<Failure,SendOtpModel>> sendOtp(SendOtpRequest sendOtpRequest);
}