import 'package:flutter_triad/features/verification/data/request/send_otp_request.dart';
import 'package:flutter_triad/features/verification/domain/models/send_otp_model.dart';
import 'package:flutter_triad/features/verification/domain/repositories/send_otp_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class SendOtpUseCase implements BaseUseCase<SendOtpInput, SendOtpModel> {
  final SendOtpRepository _repository;

  SendOtpUseCase(this._repository);

  @override
  Future<Either<Failure, SendOtpModel>> execute(SendOtpInput input) async {
    return await _repository.sendOtp(SendOtpRequest(email: input.email));
  }
}

class SendOtpInput {
  String email;

  SendOtpInput({required this.email});
}
