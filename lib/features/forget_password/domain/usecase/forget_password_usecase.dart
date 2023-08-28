import 'package:flutter_triad/features/forget_password/data/request/forget_password_request.dart';
import 'package:flutter_triad/features/forget_password/domain/models/forget_password.dart';
import 'package:flutter_triad/features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class ForgetPasswordUseCase
    implements BaseUseCase<ForgetPasswordInput, ForgetPassword> {
  final ForgetPasswordRepository _repository;

  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgetPassword>> execute(
      ForgetPasswordInput input) async {
    return await _repository.forgetPassword(
      ForgetPasswordRequest(
        email: input.email,
      ),
    );
  }
}

class ForgetPasswordInput {
  String email;

  ForgetPasswordInput({
    required this.email,
  });
}
