import 'package:flutter_triad/features/verification/data/request/verify_email_request.dart';
import 'package:flutter_triad/features/verification/domain/models/verify_email_model.dart';
import 'package:flutter_triad/features/verification/domain/repositories/verify_email_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class VerifyEmailUseCase implements BaseUseCase<VerifyEmailInput, VerifyEmail> {
  final VerifyEmailRepository _repository;

  VerifyEmailUseCase(this._repository);

  @override
  Future<Either<Failure, VerifyEmail>> execute(VerifyEmailInput input) async {
    return await _repository
        .verifyEmail(VerifyEmailRequest(email: input.email, otp: input.otp));
  }
}

class VerifyEmailInput {
  String email;
  String otp;

  VerifyEmailInput({required this.email, required this.otp});
}
