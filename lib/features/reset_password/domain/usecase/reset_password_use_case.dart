import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/core/usecase/base_usecase.dart';
import 'package:flutter_triad/features/reset_password/data/request/reset_password_request.dart';
import 'package:flutter_triad/features/reset_password/domain/repositroy/reset_password_repositroy.dart';
import 'package:dartz/dartz.dart';

import '../models/reset_password.dart';

class ResetPasswordInput {
  String email;
  String password;
  String otp;

  ResetPasswordInput({
    required this.email,
    required this.password,
    required this.otp,
  });
}

class ResetPasswordUseCase
    extends BaseUseCase<ResetPasswordInput, ResetPassword> {
  final ResetPasswordRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ResetPassword>> execute(
      ResetPasswordInput input) async {
    return await _repository.resetPassword(
      ResetPasswordRequest(
        email: input.email,
        password: input.password,
        otp: input.otp,
      ),
    );
  }
}
